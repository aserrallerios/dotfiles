#!/bin/bash
# Megalinter runner script
# Returns 0 if megalinter passes, 1 if it finds issues

set -o pipefail

echo "Running Megalinter..."

# Remove old report
rm -f megalinter-report.json

# Run megalinter via Docker (uses .megalinter.yml for config)
# REPORTERS env var sets JSON output as single source of truth
docker run --rm \
  -v "$(pwd):/tmp/lint" \
  -v "$(pwd)/.megalinter.yml:/tmp/lint/.megalinter.yml" \
  -e VALIDATE_ALL_CODEBASE=false \
  -e REPORTERS='[{"reporter":"json","params":{"file_name":"megalinter-report.json"}}]' \
  oxsecurity/megalinter:latest 2>&1 | tee /tmp/megalinter-output.txt

MEGALINTER_EXIT=${PIPESTATUS[0]}

# Check JSON report (single source of truth)
if [ -f "megalinter-report.json" ] && command -v jq &> /dev/null; then
  HAS_ERRORS=$(jq -r '.hasErrors // false' megalinter-report.json 2>/dev/null)
  if [ "$HAS_ERRORS" = "true" ]; then
    echo "✗ Megalinter: FAILED (found issues in JSON report)"
    exit 1
  else
    echo "✓ Megalinter: PASSED"
    exit 0
  fi
fi

# Fallback if no JSON report
if [ $MEGALINTER_EXIT -eq 0 ]; then
  echo "✓ Megalinter: PASSED (no JSON report, exit code 0)"
  exit 0
else
  echo "✗ Megalinter: FAILED (exit code $MEGALINTER_EXIT, no JSON report)"
  exit 1
fi
