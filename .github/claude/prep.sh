#!/usr/bin/env bash
# Priprema za Claude analizu: određuje režim (mode), model, limite i granu standardnog BC koda.
# Sadržaj issue-a je nepouzdan: iz njega se uzimaju samo cifre (verzija BC-a).
set -euo pipefail

EVENT="${GITHUB_EVENT_PATH:?}"
EVENT_NAME="${GITHUB_EVENT_NAME:?}"
: "${GH_REPO:?}"
OUT="${GITHUB_OUTPUT:-/dev/stdout}"

MAX_AUTO_RUNS="${MAX_AUTO_RUNS:-3}"
DEFAULT_MAJOR="${BC_DEFAULT_MAJOR:-29}"
CODE_HISTORY="${BC_CODE_HISTORY_REPO:-https://github.com/StefanMaron/MSDyn365BC.Code.History}"
# Komentari analize nose marker sa režimom (post.sh); u limit se broje samo automatske (initial/followup).
MARKER_PREFIX='<!-- nps-claude-triage mode='

ACTION=$(jq -r '.action // ""' "$EVENT")
ISSUE=$(jq -r '.issue.number // empty' "$EVENT")
[[ "$ISSUE" =~ ^[0-9]+$ ]] || { echo "No issue number in event payload" >&2; exit 1; }

case "$EVENT_NAME:$ACTION" in
  issues:opened)         MODE=initial ;;
  issues:labeled)        MODE=deep ;;
  issue_comment:created) MODE=followup ;;
  *) echo "Unsupported event $EVENT_NAME:$ACTION" >&2; exit 1 ;;
esac

if [[ "$MODE" == deep ]]; then
  MODEL="${CLAUDE_MODEL_DEEP:-claude-opus-5-5}";   MAX_TURNS=60; BUDGET=4.00
else
  MODEL="${CLAUDE_MODEL_AUTO:-claude-sonnet-5-5}"; MAX_TURNS=35; BUDGET=1.50
fi
[[ "$MODEL" =~ ^[a-z0-9.-]+$ ]] || { echo "Invalid model name: $MODEL" >&2; exit 1; }
[[ "$MAX_AUTO_RUNS" =~ ^[0-9]+$ ]] || MAX_AUTO_RUNS=3

RUN=true

# Followup: proveri trenutno stanje (labela je možda već skinuta u međuvremenu)
# i koliko je automatskih analiza već urađeno na ovom issue-u.
if [[ "$MODE" == followup ]]; then
  if ! gh issue view "$ISSUE" --json labels --jq '.labels[].name' | grep -qxF waiting-for-customer; then
    echo "Issue no longer has the waiting-for-customer label, skipping."
    RUN=skip
  else
    AUTO_RUNS=$(gh api --paginate "repos/$GH_REPO/issues/$ISSUE/comments" \
      --jq ".[] | select(.user.login == \"github-actions[bot]\")
                | select(.body | startswith(\"${MARKER_PREFIX}initial \") or startswith(\"${MARKER_PREFIX}followup \")) | .id" | wc -l)
    if (( AUTO_RUNS >= MAX_AUTO_RUNS )); then
      echo "Reached the limit of $MAX_AUTO_RUNS automatic analyses, handing over to the team."
      RUN=false
    fi
  fi
fi

# Verzija BC-a iz forme: prvi red posle naslova "### Business Central version" (BugReport.yml).
MAJOR=""
if [[ "$RUN" == true ]]; then
  VERSION_LINE=$(jq -r '.issue.body // ""' "$EVENT" | tr -d '\r' \
    | awk 'found && NF {print; exit} /^###[[:space:]]+(Business Central version|Verzija Business Central)/ {found=1}')
  # Prvi samostalan dvocifren broj: "29", "29.1", "W1 28.2", "BC29", "25.3.28755.0".
  MAJOR=$(printf '%s' "$VERSION_LINE" | grep -oE '(^|[^0-9])[0-9]{2}([^0-9]|$)' | head -n1 | tr -cd '0-9' || true)
  if ! [[ "$MAJOR" =~ ^[0-9]{2}$ ]] || (( 10#$MAJOR < 14 || 10#$MAJOR > 49 )); then
    MAJOR="$DEFAULT_MAJOR"
  fi
fi

branch_exists() { [[ -n "$(git ls-remote --heads "$CODE_HISTORY" "w1-$1" 2>/dev/null)" ]]; }

BC_BRANCH=""
if [[ "$RUN" == true ]]; then
  if branch_exists "$MAJOR"; then
    BC_BRANCH="w1-$MAJOR"
  elif [[ "$MAJOR" != "$DEFAULT_MAJOR" ]] && branch_exists "$DEFAULT_MAJOR"; then
    BC_BRANCH="w1-$DEFAULT_MAJOR"
  else
    echo "Warning: standard code branch not found, analysis runs without standard code." >&2
  fi
fi

# Kod ekstenzija (privatni repoi) dobija samo dubinska analiza, i to samo ako postoji EXTENSIONS_TOKEN.
# Repoi se biraju po labelama ekstenzija na issue-u (LOC, EIN...) preko extension-repos.json,
# pa nijedan naziv repoa ne dolazi direktno iz teksta prijave. Najviše 3 repoa; prvi je "primarni"
# (u njemu se otvara interni issue sa analizom).
EXT_REPOS=""
if [[ "$RUN" == true && "$MODE" == deep && "${HAS_EXTENSIONS_TOKEN:-false}" == true ]]; then
  MAP_FILE="$(dirname "$0")/extension-repos.json"
  EXT_REPOS=$(gh issue view "$ISSUE" --json labels --jq '.labels[].name' \
    | jq -R -r --slurpfile map "$MAP_FILE" '$map[0][.] // empty' \
    | awk '!seen[$0]++' | head -n 3 | tr '\n' ' ' | sed 's/ $//')
  for repo in $EXT_REPOS; do
    [[ "$repo" =~ ^[A-Za-z0-9_.-]+$ ]] || { echo "Invalid repo name in map: $repo" >&2; exit 1; }
  done
  [[ -z "$EXT_REPOS" ]] && echo "No extension label on the issue, deep analysis runs without extension code."
fi

{
  echo "run=$RUN"
  echo "mode=$MODE"
  echo "model=$MODEL"
  echo "max_turns=$MAX_TURNS"
  echo "budget=$BUDGET"
  echo "bc_branch=$BC_BRANCH"
  echo "ext_repos=$EXT_REPOS"
} >> "$OUT"

echo "Issue #$ISSUE: mode=$MODE run=$RUN model=$MODEL branch=${BC_BRANCH:-none} extensions=${EXT_REPOS:-none}"
