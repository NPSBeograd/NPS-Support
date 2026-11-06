#!/usr/bin/env bash
# Jednokratno pravi labele koje koristi Claude analiza (postojeće labele repoa se ne diraju).
# Pokretanje (lokalno, uz prijavljen gh CLI):  bash .github/claude/setup-labels.sh
set -euo pipefail
REPO="${1:-NPSBeograd/NPS-Support}"

napravi() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force; }

napravi ceka-klijenta     "fbca04" "Čeka odgovor klijenta na pitanja iz analize"
napravi za-tim            "0e8a16" "Analiza završena, spremno da tim preuzme"
napravi claude-dubinska   "5319e7" "Dodaj da pokreneš dubinsku Claude analizu (Opus)"
napravi moguce-standardno "c5def5" "Ponašanje je možda standardno u BC-u, ne do naše ekstenzije"

echo "Labele su spremne u $REPO."
