#!/usr/bin/env bash
# Objavljuje rezultat Claude analize kao komentar i postavlja labele.
# Ovde nema AI-ja: skripta uzima strukturisani JSON iz analize, čisti ga i objavljuje.
set -euo pipefail

EVENT="${GITHUB_EVENT_PATH:?}"
RUN="${RUN:-}"
MODE="${MODE:-}"
BC_BRANCH="${BC_BRANCH:-}"
ANALYZE_RESULT="${ANALYZE_RESULT:-}"
RESULT="${RESULT:-}"
# Marker sa režimom; prep.sh po njemu broji automatske analize (initial/followup) za limit.
MARKER="<!-- nps-claude-triage mode=${MODE} -->"

ISSUE=$(jq -r '.issue.number // empty' "$EVENT")
[[ "$ISSUE" =~ ^[0-9]+$ ]] || { echo "No issue number in event payload" >&2; exit 1; }

if [[ "$RUN" == skip ]]; then
  echo "Nothing to post."
  exit 0
fi

REPO_LABELS=$(gh label list --limit 500 --json name --jq '.[].name')
ISSUE_LABELS=$(gh issue view "$ISSUE" --json labels --jq '.labels[].name')

LABELS_TO_ADD=()
LABELS_TO_REMOVE=()
add_label()    { if grep -qxF -- "$1" <<<"$REPO_LABELS";  then LABELS_TO_ADD+=("$1");    fi; }
remove_label() { if grep -qxF -- "$1" <<<"$ISSUE_LABELS"; then LABELS_TO_REMOVE+=("$1"); fi; }
apply_labels() {
  local args=() label
  for label in "${LABELS_TO_ADD[@]+"${LABELS_TO_ADD[@]}"}";       do args+=(--add-label "$label");    done
  for label in "${LABELS_TO_REMOVE[@]+"${LABELS_TO_REMOVE[@]}"}"; do args+=(--remove-label "$label"); done
  if (( ${#args[@]} )); then gh issue edit "$ISSUE" "${args[@]}"; fi
}

# Čišćenje teksta koji je napisao model, pre objave u javnom repou:
#  - uklanja stvari koje liče na tokene/ključeve,
#  - gasi HTML (nema <img>, <details>... iz modela),
#  - uklanja markdown slike (spoljne slike su kanal za curenje podataka); svaki preostali
#    početak "![" (npr. referentne slike ili URL u sledećem redu) gasi kao HTML entitet,
#  - @pominjanja pretvara u kod da ne bi slala obaveštenja.
# shellcheck disable=SC2016  # backtick-ovi su namerni (markdown)
sanitize() {
  sed -E \
    -e 's/sk-ant-[A-Za-z0-9_-]+/[removed]/g' \
    -e 's/(ghp|gho|ghu|ghs|ghr)_[A-Za-z0-9]{20,}/[removed]/g' \
    -e 's/github_pat_[A-Za-z0-9_]{20,}/[removed]/g' \
    -e 's/eyJ[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}\.[A-Za-z0-9_-]{10,}/[removed]/g' \
    -e 's/</\&lt;/g' \
    -e 's/!\[[^]]*\]\([^)]*\)/[image removed]/g' \
    -e 's/!\[/\&#33;[/g' \
    -e 's/(^|[^A-Za-z0-9_`])@([A-Za-z0-9][A-Za-z0-9-]*)/\1`@\2`/g'
}

# --- Analiza nije pokrenuta jer je dostignut limit automatskih analiza ------
if [[ "$RUN" == false ]]; then
  gh issue comment "$ISSUE" --body "Hvala na dodatnim informacijama. Zahtev je prosleđen timu NPS, koji će se javiti u ovom issue-u."
  add_label ready-for-team; remove_label waiting-for-customer
  apply_labels
  exit 0
fi

# --- Analiza nije uspela ili nema ispravan izlaz -----------------------------
if [[ "$ANALYZE_RESULT" != success ]] || ! jq -e 'type == "object" and (.summary | type == "string")' <<<"$RESULT" >/dev/null 2>&1; then
  echo "::warning::Claude analysis produced no result (status: ${ANALYZE_RESULT:-unknown}). Issue goes to the team without a comment."
  add_label ready-for-team; remove_label waiting-for-customer; remove_label claude-deep-analysis
  apply_labels
  exit 0
fi

# --- Polja iz strukturisanog izlaza (dužine ograničene u jq-u) --------------
field() { jq -r "$1" <<<"$RESULT"; }
LANGUAGE=$(field '.language // "sr"')
TYPE=$(field '.type // ""')
STANDARD=$(field '.standard_behavior // "unknown"')
PRIORITY=$(field '.priority // ""')
EXTENSION=$(field '(.extension // "")[:100]' | sanitize)
SUMMARY=$(field '(.summary // "")[:2000]' | sanitize)
ANALYSIS=$(field '(.analysis // "")[:12000]' | sanitize)
QUESTIONS=$(field '(.questions // [])[:6] | to_entries[] | "\(.key + 1). \(.value[:500] | gsub("\n"; " "))"' | sanitize)
# shellcheck disable=SC2016
REFERENCES=$(field '(.references // [])[:15][]
  | "- `\(.path[:200] | gsub("`"; ""))`"
    + (if (.object // "") != "" then " — \(.object[:150])" else "" end)
    + (if (.note // "") != "" then ": \(.note[:300] | gsub("\n"; " "))" else "" end)' | sanitize)

if [[ "$LANGUAGE" == en ]]; then
  TXT_INTRO="**Automated analysis (AI).** The NPS team will review this request and follow up."
  TXT_SUMMARY="### Our understanding of the request"
  TXT_QUESTIONS="### Additional information needed"
  TXT_REPLY="Please reply in a comment below. Do not post passwords or confidential data — this repository is public."
  TXT_TECH="Technical analysis for the NPS team"
else
  TXT_INTRO="**Automatska analiza (AI).** Tim NPS će pregledati zahtev i javiti se."
  TXT_SUMMARY="### Kako smo razumeli zahtev"
  TXT_QUESTIONS="### Potrebne dodatne informacije"
  TXT_REPLY="Molimo odgovorite u komentaru ispod. Ne unosite lozinke ni poverljive podatke — repozitorijum je javan."
  TXT_TECH="Tehnička analiza za NPS tim"
fi

case "$STANDARD" in
  yes)   STANDARD_TXT="verovatno da" ;;
  maybe) STANDARD_TXT="moguće" ;;
  no)    STANDARD_TXT="verovatno ne" ;;
  *)     STANDARD_TXT="nije utvrđeno" ;;
esac

BODY_FILE=$(mktemp)
{
  echo "$MARKER"
  echo "$TXT_INTRO"
  echo
  echo "$TXT_SUMMARY"
  echo "$SUMMARY"
  if [[ -n "$QUESTIONS" ]]; then
    echo
    echo "$TXT_QUESTIONS"
    echo "$QUESTIONS"
    echo
    echo "_${TXT_REPLY}_"
  fi
  echo
  echo "<details><summary>${TXT_TECH}</summary>"
  echo
  echo "**Režim:** ${MODE} · **Tip:** ${TYPE:-?} · **Ekstenzija:** ${EXTENSION:-?} · **Standardno BC ponašanje:** ${STANDARD_TXT} · **Predlog prioriteta:** ${PRIORITY:-?}"
  echo
  echo "$ANALYSIS"
  if [[ -n "$REFERENCES" ]]; then
    echo
    echo "**Reference u standardnom kodu${BC_BRANCH:+ (${BC_BRANCH})}:**"
    echo "$REFERENCES"
  fi
  echo
  echo "</details>"
} > "$BODY_FILE"

gh issue comment "$ISSUE" --body-file "$BODY_FILE"

# --- Labele -----------------------------------------------------------------
# Tip (bug / suggestion / question) dodaje se samo ako ga issue još nema — forma ili tim imaju prednost.
# Prioritet i ekstenziju analiza ne postavlja: prioritet je samo predlog u komentaru,
# a ekstenziju postavlja postojeći issueLabeler iz forme.
if ! grep -qxE 'bug|suggestion|question' <<<"$ISSUE_LABELS"; then
  case "$TYPE" in
    bug|suggestion|question) add_label "$TYPE" ;;
  esac
fi

if [[ "$STANDARD" == yes || "$STANDARD" == maybe ]]; then add_label possibly-standard; else remove_label possibly-standard; fi

if [[ -n "$QUESTIONS" ]]; then
  add_label waiting-for-customer; remove_label ready-for-team
else
  add_label ready-for-team; remove_label waiting-for-customer
fi

[[ "$MODE" == deep ]] && remove_label claude-deep-analysis

apply_labels
echo "Posted on issue #$ISSUE."
