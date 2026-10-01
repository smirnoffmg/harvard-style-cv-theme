#!/usr/bin/env bash
# Usage: git log --no-merges --format='%B%x00' <tag>..HEAD | next-version.sh <tag>
# Prints the next semver (without "v"), or nothing when no commit warrants a release.
set -euo pipefail

last_tag="${1:-}"

breaking_subject='^[a-z]+(\([^)]*\))?!:'
feat_subject='^feat(\([^)]*\))?:'
silent_subject='^(docs|ci|chore|style|test|build|refactor)(\([^)]*\))?:'

# 0 none, 1 patch, 2 minor, 3 major
level=0
while IFS= read -r -d '' msg; do
  msg="${msg#"${msg%%[!$'\n']*}"}"
  [[ -z "$msg" ]] && continue
  subject="${msg%%$'\n'*}"

  if [[ $subject =~ $breaking_subject ]] || grep -qE '^BREAKING[ -]CHANGE:' <<<"$msg"; then
    rank=3
  elif [[ $subject =~ $feat_subject ]]; then
    rank=2
  elif [[ $subject =~ $silent_subject ]]; then
    rank=0
  else
    # Non-conventional subjects still ship user-visible changes in this repo's history.
    rank=1
  fi
  (( rank > level )) && level=$rank
done

(( level == 0 )) && exit 0

if [[ -z "$last_tag" ]]; then
  echo "1.0.0"
  exit 0
fi

IFS=. read -r major minor patch <<<"${last_tag#v}"
case $level in
  3) echo "$((major + 1)).0.0" ;;
  2) echo "$major.$((minor + 1)).0" ;;
  1) echo "$major.$minor.$((patch + 1))" ;;
esac
