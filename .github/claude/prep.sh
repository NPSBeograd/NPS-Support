#!/usr/bin/env bash
# Priprema za Claude analizu: određuje režim, model, limite i granu standardnog BC koda.
# Sadržaj issue-a je nepouzdan: iz njega se uzimaju samo cifre (verzija BC-a).
set -euo pipefail

EVENT="${GITHUB_EVENT_PATH:?}"
EVENT_NAME="${GITHUB_EVENT_NAME:?}"
: "${GH_REPO:?}"
OUT="${GITHUB_OUTPUT:-/dev/stdout}"

MAX_ANALIZA="${MAX_ANALIZA:-3}"
DEFAULT_MAJOR="${BC_DEFAULT_MAJOR:-29}"
CODE_HISTORY="${BC_CODE_HISTORY_REPO:-https://github.com/StefanMaron/MSDyn365BC.Code.History}"
# Komentari analize nose marker sa režimom (post.sh); u limit se broje samo automatske (prva/dopuna).
MARKER_PREFIX='<!-- nps-claude-analiza rezim='

ACTION=$(jq -r '.action // ""' "$EVENT")
ISSUE=$(jq -r '.issue.number // empty' "$EVENT")
[[ "$ISSUE" =~ ^[0-9]+$ ]] || { echo "Nema broja issue-a u događaju" >&2; exit 1; }

case "$EVENT_NAME:$ACTION" in
  issues:opened)         REZIM=prva ;;
  issues:labeled)        REZIM=dubinska ;;
  issue_comment:created) REZIM=dopuna ;;
  *) echo "Nepodržan događaj $EVENT_NAME:$ACTION" >&2; exit 1 ;;
esac

if [[ "$REZIM" == dubinska ]]; then
  MODEL="${CLAUDE_MODEL_DUBINSKA:-claude-opus-5-5}"; MAX_TURNS=60; BUDGET=4.00
else
  MODEL="${CLAUDE_MODEL_AUTO:-claude-sonnet-5-5}";  MAX_TURNS=35; BUDGET=1.50
fi
[[ "$MODEL" =~ ^[a-z0-9.-]+$ ]] || { echo "Neispravan naziv modela: $MODEL" >&2; exit 1; }
[[ "$MAX_ANALIZA" =~ ^[0-9]+$ ]] || MAX_ANALIZA=3

RUN=true

# Dopuna: proveri trenutno stanje (labela je možda već skinuta u međuvremenu)
# i koliko je automatskih analiza već urađeno na ovom issue-u.
if [[ "$REZIM" == dopuna ]]; then
  if ! gh issue view "$ISSUE" --json labels --jq '.labels[].name' | grep -qxF ceka-klijenta; then
    echo "Issue više nema labelu ceka-klijenta, preskačem."
    RUN=skip
  else
    BROJ=$(gh api --paginate "repos/$GH_REPO/issues/$ISSUE/comments" \
      --jq ".[] | select(.user.login == \"github-actions[bot]\")
                | select(.body | startswith(\"${MARKER_PREFIX}prva \") or startswith(\"${MARKER_PREFIX}dopuna \")) | .id" | wc -l)
    if (( BROJ >= MAX_ANALIZA )); then
      echo "Dostignut limit od $MAX_ANALIZA automatskih analiza, prosleđujem timu."
      RUN=false
    fi
  fi
fi

# Verzija BC-a iz forme: prvi red posle naslova "### Business Central version" (BugReport.yml).
MAJOR=""
if [[ "$RUN" == true ]]; then
  VER_LINE=$(jq -r '.issue.body // ""' "$EVENT" | tr -d '\r' \
    | awk 'found && NF {print; exit} /^###[[:space:]]+(Business Central version|Verzija Business Central)/ {found=1}')
  # Prvi samostalan dvocifren broj: "29", "29.1", "W1 28.2", "BC29", "25.3.28755.0".
  MAJOR=$(printf '%s' "$VER_LINE" | grep -oE '(^|[^0-9])[0-9]{2}([^0-9]|$)' | head -n1 | tr -cd '0-9' || true)
  if ! [[ "$MAJOR" =~ ^[0-9]{2}$ ]] || (( 10#$MAJOR < 14 || 10#$MAJOR > 49 )); then
    MAJOR="$DEFAULT_MAJOR"
  fi
fi

grana_postoji() { [[ -n "$(git ls-remote --heads "$CODE_HISTORY" "w1-$1" 2>/dev/null)" ]]; }

BC_GRANA=""
if [[ "$RUN" == true ]]; then
  if grana_postoji "$MAJOR"; then
    BC_GRANA="w1-$MAJOR"
  elif [[ "$MAJOR" != "$DEFAULT_MAJOR" ]] && grana_postoji "$DEFAULT_MAJOR"; then
    BC_GRANA="w1-$DEFAULT_MAJOR"
  else
    echo "Upozorenje: grana standardnog koda nije pronađena, analiza ide bez standardnog koda." >&2
  fi
fi

{
  echo "run=$RUN"
  echo "rezim=$REZIM"
  echo "model=$MODEL"
  echo "max_turns=$MAX_TURNS"
  echo "budget=$BUDGET"
  echo "bc_grana=$BC_GRANA"
} >> "$OUT"

echo "Issue #$ISSUE: režim=$REZIM run=$RUN model=$MODEL grana=${BC_GRANA:-nema}"
