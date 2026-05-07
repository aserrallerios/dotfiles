#!/bin/bash
# MegaLinter local runner script
# Runs MegaLinter via Docker and outputs the markdown summary
# Returns 0 if MegaLinter passes, 1 if it finds issues

set -euo pipefail

REPORT_DIR="megalinter-reports"

echo "Running MegaLinter..."

# Clean previous reports
rm -rf "$REPORT_DIR" mega-linter.log

# Run MegaLinter via Docker with proper volume mounts
# Reports are written to megalinter-reports/ in the workspace
docker run --rm \
  -v "$(pwd):/tmp/lint:rw" \
  -e DEFAULT_WORKSPACE=/tmp/lint \
  -e VALIDATE_ALL_CODEBASE=true \
  oxsecurity/megalinter:v9

MEGALINTER_EXIT=$?

# Display the markdown summary if available
if [ -f "$REPORT_DIR/megalinter-report.md" ]; then
  echo ""
  echo "========== MegaLinter Summary =========="
  cat "$REPORT_DIR/megalinter-report.md"
  echo "========================================"
fi

# Exit with MegaLinter's exit code
if [ $MEGALINTER_EXIT -eq 0 ]; then
  echo "✓ MegaLinter: PASSED"
else
  echo "✗ MegaLinter: FAILED"
fi
exit $MEGALINTER_EXIT
