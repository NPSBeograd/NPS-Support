#!/usr/bin/env bash
# Jednokratno pravi labele koje koristi Claude analiza (postojeće labele repoa se ne diraju).
# Pokretanje (lokalno, uz prijavljen gh CLI):  bash .github/claude/setup-labels.sh
set -euo pipefail
REPO="${1:-NPSBeograd/NPS-Support}"

napravi() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force; }

napravi waiting-for-customer     "fbca04" "Waiting for the customer to answer questions from the analysis"
napravi ready-for-team            "0e8a16" "Analysis done, ready for the team to pick up"
napravi claude-deep-analysis   "5319e7" "Add to run a deep Claude analysis (Opus)"
napravi possibly-standard "c5def5" "Behavior may be standard Business Central, not caused by our extension"

echo "Labele su spremne u $REPO."
