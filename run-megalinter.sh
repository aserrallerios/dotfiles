#!/bin/bash
# Megalinter runner script
# Returns 0 if megalinter passes, 1 if it finds issues

set -o pipefail

echo "Running Megalinter..."

# Run megalinter via Docker and capture exit code
docker run --rm \
  -v "$(pwd):/tmp/lint" \
  -e VALIDATE_ALL_CODEBASE=false \
  megalinter/megalinter:v6 2>&1 | tee /tmp/megalinter-output.txt

MEGALINTER_EXIT=${PIPESTATUS[0]}

if [ $MEGALINTER_EXIT -eq 0 ]; then
  echo "✓ Megalinter: PASSED"
  exit 0
else
  echo "✗ Megalinter: FAILED"
  exit 1
fi
