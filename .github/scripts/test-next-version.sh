#!/usr/bin/env bash
set -uo pipefail

script="$(dirname "$0")/next-version.sh"
failures=0

check() {
  local name="$1" tag="$2" expected="$3"
  shift 3
  local actual
  actual="$(printf '%s\0' "$@" | "$script" "$tag")"
  if [[ "$actual" == "$expected" ]]; then
    echo "ok   $name"
  else
    echo "FAIL $name: expected '$expected', got '$actual'"
    failures=$((failures + 1))
  fi
}

check "fix bumps patch"              v1.1.0 1.1.1 "fix: typo"
check "feat bumps minor"             v1.1.0 1.2.0 "fix: a" "feat: b"
check "scoped feat bumps minor"      v1.1.0 1.2.0 "feat(css): narrower column"
check "bang bumps major"             v1.1.0 2.0.0 "feat!: drop twitter"
check "scoped bang bumps major"      v1.1.0 2.0.0 "refactor(layout)!: rename fields"
check "BREAKING CHANGE footer"       v1.1.0 2.0.0 $'fix: x\n\nBREAKING CHANGE: sub renamed'
check "non-conventional is patch"    v1.1.0 1.1.1 "use modern YM script"
check "docs only skips release"      v1.1.0 ""    "docs: readme" "ci: cache" "chore(deps): bump"
check "docs plus fix is patch"       v1.1.0 1.1.1 "docs: readme" "fix: bug"
check "no commits skips release"     v1.1.0 ""
check "first release is 1.0.0"       ""     1.0.0 "feat: initial"
check "leading newline from git log" v1.1.0 1.2.0 $'\nfeat: b'

exit $((failures > 0))
