#!/bin/bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$PROJECT_ROOT/scripts/generate-report.sh"
source "$PROJECT_ROOT/tests/test_helper.bash"
stub_report_checks

OUTPUT_DIR="$(mktemp -d "${TMPDIR:-/tmp}/clawgears-report.XXXXXX")"
trap 'rm -rf "$OUTPUT_DIR"' EXIT
main --format html --output "$OUTPUT_DIR"
main --format json --output "$OUTPUT_DIR"
python3 - "$OUTPUT_DIR" <<'PY'
import json, pathlib, sys
root = pathlib.Path(sys.argv[1])
html, = root.glob('*.html')
report, = root.glob('*.json')
assert '<!DOCTYPE html>' in html.read_text()
assert '</html>' in html.read_text()
data = json.loads(report.read_text())
assert len(data['checks']) == 8
assert data['summary']['passed'] == 8
assert data['summary']['failed'] == 0
print('Synthetic HTML and JSON reports verified; no host audit was run.')
PY
