#!/bin/bash
# Megalinter runner script
# Returns 0 if megalinter passes, 1 if it finds issues

set -o pipefail

echo "Running Megalinter..."

# Remove old reports
rm -f megalinter-report.txt megalinter-report.json

# Run megalinter via Docker
docker run --rm \
  -v "$(pwd):/tmp/lint" \
  -v "$(pwd)/.megalinter.yml:/tmp/lint/.megalinter.yml" \
  -e VALIDATE_ALL_CODEBASE=false \
  megalinter/megalinter:latest 2>&1 | tee /tmp/megalinter-output.txt

MEGALINTER_EXIT=${PIPESTATUS[0]}

# Check exit code first
if [ $MEGALINTER_EXIT -eq 0 ]; then
  echo "✓ Megalinter: PASSED"
  exit 0
fi

# If non-zero exit, check reports for actual errors
if [ -f "megalinter-report.json" ]; then
  if command -v jq &> /dev/null; then
    HAS_ERRORS=$(jq -r '.hasErrors // false' megalinter-report.json 2>/dev/null)
    if [ "$HAS_ERRORS" = "true" ]; then
      echo "✗ Megalinter: FAILED (found issues in JSON report)"
      exit 1
    else
      echo "✓ Megalinter: PASSED (no errors in JSON report)"
      exit 0
    fi
  fi
fi

# Fallback: check text report
if [ -f "megalinter-report.txt" ]; then
  if grep -qi "error\|failed" megalinter-report.txt; then
    echo "✗ Megalinter: FAILED (found errors in text report)"
    exit 1
  else
    echo "✓ Megalinter: PASSED (no errors in text report)"
    exit 0
  fi
fi

# If we get here with non-zero exit, it failed
echo "✗ Megalinter: FAILED (exit code $MEGALINTER_EXIT)"
exit 1
