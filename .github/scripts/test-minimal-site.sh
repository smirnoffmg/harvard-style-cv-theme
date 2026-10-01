#!/usr/bin/env bash
# Builds a consumer site that sets only the required fields, using this
# checkout's layouts and styles, and checks optional parts degrade cleanly.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
site="$(mktemp -d)"
trap 'rm -rf "$site"' EXIT

cp -R "$root/_layouts" "$root/assets" "$root/index.md" "$site/"
mkdir -p "$site/_data"

cat > "$site/_config.yml" <<'EOF'
title: "Test Person"
email: "test@example.com"
url: "https://example.com"
baseurl: ""
plugins:
  - jekyll-seo-tag
EOF

cat > "$site/_data/cv.yml" <<'EOF'
sections:
  - title: Experience
    entries:
      - title: "Only Title"
      - title: "With Bullets"
        bullets:
          - "See [docs](https://example.com)"
EOF

BUNDLE_GEMFILE="$root/Gemfile" bundle exec jekyll build -q -s "$site" -d "$site/_site"
html="$site/_site/index.html"

failures=0
expect() {
  if grep -qE "$2" "$html"; then echo "ok   $1"; else echo "FAIL $1"; failures=$((failures + 1)); fi
}
reject() {
  if grep -qE "$2" "$html"; then echo "FAIL $1"; failures=$((failures + 1)); else echo "ok   $1"; fi
}

expect "name rendered"              'class="cv-name">Test Person<'
expect "email link"                 'href="mailto:test@example.com"'
expect "section title upcased"      '>EXPERIENCE<'
expect "markdown link in bullet"    '<a href="https://example.com">docs</a>'
reject "no social links when unset" 'linkedin|github\.com|t\.me|leetcode'
reject "no JS without analytics"    '<script(>| async| src| type="text/javascript")'
reject "no empty bullet list"       '<ul class="cv-entry-bullets">[[:space:]]*</ul>'
test -f "$site/_site/assets/css/main.css" && echo "ok   css built" || { echo "FAIL css built"; failures=$((failures + 1)); }

exit $((failures > 0))
