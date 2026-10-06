#!/usr/bin/env bash
# scan.sh - Scan It, Map It, Ship It workshop scanner wrapper
# Usage: ./scan.sh path/to/your-app
# Runs Bearer's privacy (dataflow) and security reports, writes JSON to
# outputs/, and captures a diagnostic bundle so troubleshooting takes seconds.
set -u
TARGET="${1:-sample-app}"
OUT="outputs"
DIAG="$OUT/diagnostic.txt"
mkdir -p "$OUT"

# --- find bearer, wherever the installer put it -----------------------------
BEARER="$(command -v bearer || true)"
[ -z "$BEARER" ] && [ -x "./bin/bearer" ] && BEARER="./bin/bearer"
[ -z "$BEARER" ] && [ -x "$HOME/bin/bearer" ] && BEARER="$HOME/bin/bearer"
if [ -z "$BEARER" ]; then
  echo "ERROR: bearer not found. The installer puts it in ./bin of the folder"
  echo "you installed from. Fix permanently with:"
  echo "  sudo mv ./bin/bearer /usr/local/bin/   (or ~/bin/bearer)"
  exit 1
fi

# --- diagnostic header -------------------------------------------------------
{
  echo "=== scan.sh diagnostic $(date) ==="
  echo "OS: $(uname -a)"
  echo "Bearer: $($BEARER version 2>&1 | head -1)"
  echo "Target: $TARGET"
} > "$DIAG"

# --- language census: catch the silent-clean trap ----------------------------
SUPPORTED="js jsx ts tsx py rb java php go"
UNSUPPORTED_FOUND=""
for ext in rs cs swift kt; do
  if find "$TARGET" -name "*.$ext" -not -path "*/node_modules/*" 2>/dev/null | grep -q .; then
    UNSUPPORTED_FOUND="$UNSUPPORTED_FOUND .$ext"
  fi
done
echo "Language census: unsupported found:${UNSUPPORTED_FOUND:- none}" >> "$DIAG"
if [ -n "$UNSUPPORTED_FOUND" ]; then
  echo ""
  echo "!! WARNING: found$UNSUPPORTED_FOUND files. Bearer's free CLI does NOT scan"
  echo "!! Rust, C#, Swift or Kotlin, and it exits clean instead of erroring."
  echo "!! An empty result for those files does NOT mean they are clean."
  echo "!! Use worksheets/data-inventory-worksheet.md for that code."
  echo ""
fi

# --- privacy report (the workshop's main event) -------------------------------
echo "1/2 privacy (dataflow) report -> $OUT/dataflow.json"
$BEARER scan "$TARGET" --report dataflow --format json --output "$OUT/dataflow.json" --quiet 2>>"$DIAG"
echo "dataflow exit: $?" >> "$DIAG"

# --- security report ----------------------------------------------------------
echo "2/2 security report -> $OUT/security.json"
$BEARER scan "$TARGET" --report security --format json --output "$OUT/security.json" --quiet 2>>"$DIAG"
echo "security exit: $?" >> "$DIAG"

for f in dataflow security; do
  SIZE=$(wc -c < "$OUT/$f.json" 2>/dev/null || echo 0)
  echo "$f.json bytes: $SIZE" >> "$DIAG"
done

echo ""
echo "Done. JSON in $OUT/. If anything looks wrong, paste $DIAG into the Zoom chat."
