#!/usr/bin/env bash
# Every skill in a plugin with a tools.json names only tools on that list.
# A skill declares its tools on a "Tools:" line; every snake_case name in its
# body must be on that line, so a tool can't be used without being declared.
set -euo pipefail
status=0
for list in plugins/*/tools.json; do
  [ -f "$list" ] || continue
  plugin=$(dirname "$list")
  allowed=$(jq -r '.tools[]' "$list")
  for skill in "$plugin"/skills/*/SKILL.md; do
    declared=$(grep -m1 '^Tools:' "$skill" | grep -oE '`[a-z_]+`' | tr -d '`' || true)
    if [ -z "$declared" ]; then
      echo "✗ $skill has no 'Tools:' line"; status=1; continue
    fi
    for tool in $declared; do
      grep -qx "$tool" <<<"$allowed" || { echo "✗ $skill names '$tool', which is not in $list"; status=1; }
    done
    for word in $(grep -ohE '\b[a-z]+(_[a-z]+)+\b' "$skill" | sort -u); do
      grep -qx "$word" <<<"$declared" || { echo "✗ $skill uses '$word' but its 'Tools:' line doesn't declare it"; status=1; }
    done
    echo "✓ $skill"
  done
done
exit $status
