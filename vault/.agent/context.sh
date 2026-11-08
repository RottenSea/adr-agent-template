#!/bin/sh
# Print the context an agent needs at the start of a session.
# Usage: sh .agent/context.sh [project]

cd "$(dirname "$0")/.." || exit 1

show() {
  [ -f "$1" ] || return 0
  printf '\n===== %s =====\n' "$1"
  cat "$1"
}

show .agent/core.md
show .agent/workflow.md
show 1-Memory/project.md
show 1-Memory/experiences.md
show 2-Skills/index.md
show 2-Skills/observed.md

if [ -n "$1" ]; then
  for f in 1-Memory/"$1"/*.md; do show "$f"; done
  show 3-Decisions/"$1"/index.md
  printf '\n===== 4-Discussions/%s =====\n' "$1"
  ls 4-Discussions/"$1" 2>/dev/null
fi
