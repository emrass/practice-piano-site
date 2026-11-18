#!/bin/sh
# Copies the design system from the app repository into this page: the built tokens.css and
# site-fonts.css (font paths pointed at ./fonts/), the font files the page uses, and the favicon.
# The page has no build step; run this after the design system changes, then commit the copies.
#
#   sh scripts/sync-design.sh [path to practice-piano]   (default: ../practice-piano)
set -eu
APP=${1:-../practice-piano}
(cd "$APP" && npm run --silent design:build)
for f in tokens.css site-fonts.css; do
  sed 's#\.\./system/fonts/#./fonts/#g' "$APP/design/dist/$f" > "$f"
done
for f in newsreader-latin-opsz-normal caveat-latin-500-normal caveat-latin-700-normal; do
  cp "$APP/design/system/fonts/$f.woff2" fonts/
done
cp "$APP/public/favicon.svg" favicon.svg
echo "Copied the design system from $APP."
