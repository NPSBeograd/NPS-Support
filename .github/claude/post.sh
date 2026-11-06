#!/usr/bin/env bash
# Objavljuje rezultat Claude analize kao komentar i postavlja labele.
# Ovde nema AI-ja: skripta uzima strukturisani JSON iz analize, čisti ga i objavljuje.
set -euo pipefail

EVENT="${GITHUB_EVENT_PATH:?}"
RUN="${RUN:-}"
REZIM="${REZIM:-}"
BC_GRANA="${BC_GRANA:-}"
ANALYZE_RESULT="${ANALYZE_RESULT:-}"
RESULT="${RESULT:-}"
MARKER='<!-- nps-claude-analiza -->'

ISSUE=$(jq -r '.issue.number // empty' "$EVENT")
[[ "$ISSUE" =~ ^[0-9]+$ ]] || { echo "Nema broja issue-a u događaju" >&2; exit 1; }

if [[ "$RUN" == skip ]]; then
  echo "Ništa za objavu."
  exit 0
fi

REPO_LABELS=$(gh label list --limit 500 --json name --jq '.[].name')
ISSUE_LABELS=$(gh issue view "$ISSUE" --json labels --jq '.labels[].name')

ADD=()
REMOVE=()
dodaj()  { if grep -qxF -- "$1" <<<"$REPO_LABELS";  then ADD+=("$1");    fi; }
ukloni() { if grep -qxF -- "$1" <<<"$ISSUE_LABELS"; then REMOVE+=("$1"); fi; }
primeni_labele() {
  local args=() l
  for l in "${ADD[@]+"${ADD[@]}"}";       do args+=(--add-label "$l");    done
  for l in "${REMOVE[@]+"${REMOVE[@]}"}"; do args+=(--remove-label "$l"); done
  if (( ${#args[@]} )); then gh issue edit "$ISSUE" "${args[@]}"; fi
}

# Čišćenje teksta koji je napisao model, pre objave u javnom repou:
#  - uklanja stvari koje liče na tokene/ključeve,
#  - gasi HTML (nema <img>, <details>... iz modela),
#  - uklanja markdown slike (spoljne slike su kanal za curenje podataka),
#  - @pominjanja pretvara u kod da ne bi slala obaveštenja.
# shellcheck disable=SC2016  # backtick-ovi su namerni (markdown)
ocisti() {
  sed -E \
    -e 's/sk-ant-[A-Za-z0-9_-]+/[uklonjeno]/g' \
    -e 's/(ghp|gho|ghu|ghs|ghr)_[A-Za-z0-9]{20,}/[uklonjeno]/g' \
    -e 's/github_pat_[A-Za-z0-9_]{20,}/[uklonjeno]/g' \
    -e 's/eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}/[uklonjeno]/g' \
    -e 's/</\&lt;/g' \
    -e 's/!\[[^]]*\]\([^)]*\)/[slika uklonjena]/g' \
    -e 's/(^|[^A-Za-z0-9_`])@([A-Za-z0-9][A-Za-z0-9-]*)/\1`@\2`/g'
}

# --- Analiza nije pokrenuta jer je dostignut limit dopuna -------------------
if [[ "$RUN" == false ]]; then
  gh issue comment "$ISSUE" --body "Hvala na dodatnim informacijama. Zahtev je prosleđen timu NPS, koji će se javiti u ovom issue-u."
  dodaj za-tim; ukloni ceka-klijenta
  primeni_labele
  exit 0
fi

# --- Analiza nije uspela ili nema ispravan izlaz -----------------------------
if [[ "$ANALYZE_RESULT" != success ]] || ! jq -e 'type == "object" and (.sazetak | type == "string")' <<<"$RESULT" >/dev/null 2>&1; then
  echo "::warning::Claude analiza nije dala rezultat (status: ${ANALYZE_RESULT:-nepoznat}). Issue ide timu bez komentara."
  dodaj za-tim; ukloni claude-dubinska
  primeni_labele
  exit 0
fi

# --- Polja iz strukturisanog izlaza (dužine ograničene u jq-u) --------------
polje() { jq -r "$1" <<<"$RESULT"; }
JEZIK=$(polje '.jezik // "sr"')
TIP=$(polje '.tip // ""')
STD=$(polje '.standardno_ponasanje // "nepoznato"')
PRIO=$(polje '.prioritet // ""')
EKST=$(polje '(.ekstenzija // "")[:100]' | ocisti)
SAZETAK=$(polje '(.sazetak // "")[:2000]' | ocisti)
ANALIZA=$(polje '(.analiza // "")[:12000]' | ocisti)
PITANJA=$(polje '(.pitanja // [])[:6] | to_entries[] | "\(.key + 1). \(.value[:500] | gsub("\n"; " "))"' | ocisti)
# shellcheck disable=SC2016
REFERENCE=$(polje '(.reference // [])[:15][]
  | "- `\(.putanja[:200] | gsub("`"; ""))`"
    + (if (.objekat // "") != "" then " — \(.objekat[:150])" else "" end)
    + (if (.napomena // "") != "" then ": \(.napomena[:300] | gsub("\n"; " "))" else "" end)' | ocisti)

if [[ "$JEZIK" == en ]]; then
  H_UVOD="**Automated analysis (AI).** The NPS team will review this request and follow up."
  H_SAZETAK="### Our understanding of the request"
  H_PITANJA="### Additional information needed"
  H_ODGOVOR="Please reply in a comment below. Do not post passwords or confidential data — this repository is public."
  H_TEH="Technical analysis for the NPS team"
else
  H_UVOD="**Automatska analiza (AI).** Tim NPS će pregledati zahtev i javiti se."
  H_SAZETAK="### Kako smo razumeli zahtev"
  H_PITANJA="### Potrebne dodatne informacije"
  H_ODGOVOR="Molimo odgovorite u komentaru ispod. Ne unosite lozinke ni poverljive podatke — repozitorijum je javan."
  H_TEH="Tehnička analiza za NPS tim"
fi

case "$STD" in
  da)       STD_TXT="verovatno da" ;;
  mozda)    STD_TXT="moguće" ;;
  ne)       STD_TXT="verovatno ne" ;;
  *)        STD_TXT="nije utvrđeno" ;;
esac

TELO=$(mktemp)
{
  echo "$MARKER"
  echo "$H_UVOD"
  echo
  echo "$H_SAZETAK"
  echo "$SAZETAK"
  if [[ -n "$PITANJA" ]]; then
    echo
    echo "$H_PITANJA"
    echo "$PITANJA"
    echo
    echo "_${H_ODGOVOR}_"
  fi
  echo
  echo "<details><summary>${H_TEH}</summary>"
  echo
  echo "**Režim:** ${REZIM} · **Tip:** ${TIP:-?} · **Ekstenzija:** ${EKST:-?} · **Standardno BC ponašanje:** ${STD_TXT} · **Predlog prioriteta:** ${PRIO:-?}"
  echo
  echo "$ANALIZA"
  if [[ -n "$REFERENCE" ]]; then
    echo
    echo "**Reference u standardnom kodu${BC_GRANA:+ (${BC_GRANA})}:**"
    echo "$REFERENCE"
  fi
  echo
  echo "</details>"
} > "$TELO"

gh issue comment "$ISSUE" --body-file "$TELO"

# --- Labele -----------------------------------------------------------------
# Tip (bug / suggestion / question) dodaje se samo ako ga issue još nema — forma ili tim imaju prednost.
# Prioritet i ekstenziju analiza ne postavlja: prioritet je samo predlog u komentaru,
# a ekstenziju postavlja postojeći issueLabeler iz forme.
if ! grep -qxE 'bug|suggestion|question' <<<"$ISSUE_LABELS"; then
  case "$TIP" in
    greska)           dodaj bug ;;
    zahtev-za-izmenu) dodaj suggestion ;;
    pitanje)          dodaj question ;;
  esac
fi

if [[ "$STD" == da || "$STD" == mozda ]]; then dodaj moguce-standardno; else ukloni moguce-standardno; fi

if [[ -n "$PITANJA" ]]; then
  dodaj ceka-klijenta; ukloni za-tim
else
  dodaj za-tim; ukloni ceka-klijenta
fi

[[ "$REZIM" == dubinska ]] && ukloni claude-dubinska

primeni_labele
echo "Objavljeno na issue #$ISSUE."
