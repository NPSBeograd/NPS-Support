#!/usr/bin/env bash
# Preuzima sadržaj prijave i listu postojećih prijava u fajlove za agenta.
# Agent tako nema GitHub token ni Bash — samo čita ove fajlove.
set -euo pipefail

: "${GH_REPO:?}"
ISSUE="${ISSUE:?}"
OUT_DIR="${OUT_DIR:-.triage}"
[[ "$ISSUE" =~ ^[0-9]+$ ]] || { echo "Invalid issue number" >&2; exit 1; }

mkdir -p "$OUT_DIR"

# Prijava sa svim komentarima, kao markdown.
gh issue view "$ISSUE" --json number,title,body,author,labels,state,createdAt,comments \
  | jq -r '
      "# Issue #\(.number): \(.title)",
      "",
      "- Author: \(.author.login)",
      "- State: \(.state)",
      "- Created: \(.createdAt)",
      "- Labels: \([.labels[].name] | join(", "))",
      "",
      "## Body",
      "",
      (.body // ""),
      "",
      "## Comments",
      "",
      (if (.comments | length) == 0 then "(no comments)" else
        (.comments[] | "### \(.author.login) (\(.createdAt))", "", .body, "")
      end)
    ' > "$OUT_DIR/issue.md"

# Lista svih ostalih prijava (broj, stanje, naslov, labele) za traženje sličnih.
# gh issue list vraća samo issue-e (ne pull request-ove); greške gh/jq prekidaju skriptu (pipefail).
gh issue list --state all --limit 5000 --json number,title,state,labels \
  | jq -r --argjson current "$ISSUE" \
      '.[] | select(.number != $current) | "#\(.number) [\(.state)] \(.title) (\([.labels[].name] | join(", ")))"' \
  > "$OUT_DIR/issues-list.md"

echo "Fetched issue #$ISSUE ($(wc -c < "$OUT_DIR/issue.md") bytes) and $(wc -l < "$OUT_DIR/issues-list.md") other issues."
