#!/bin/sh
# Workspace helper for the SwimResults multi-repo setup.
#   scripts/ws.sh clone    clone every repo from scripts/repos.txt that is missing (skips ones you can't access)
#   scripts/ws.sh pull     fast-forward pull every cloned repo on its current branch
#   scripts/ws.sh status   branch, ahead/behind and dirty state of every repo
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
LIST="$ROOT/scripts/repos.txt"

repos() { grep -vE '^\s*(#|$)' "$LIST"; }

case "${1:-status}" in
  clone)
    repos | while read -r path repo; do
      if [ -d "$ROOT/$path/.git" ]; then echo "✓ $path"; continue; fi
      mkdir -p "$(dirname "$ROOT/$path")"
      git clone -q "https://github.com/$repo.git" "$ROOT/$path" && echo "+ $path" || echo "! $path (no access?)"
    done ;;
  pull)
    repos | while read -r path _; do
      [ -d "$ROOT/$path/.git" ] || continue
      printf '%-30s ' "$path"; git -C "$ROOT/$path" pull -q --ff-only && echo ok || echo "FAILED"
    done ;;
  status)
    repos | while read -r path _; do
      d="$ROOT/$path"
      if [ ! -d "$d/.git" ]; then printf '%-30s %s\n' "$path" "(not cloned)"; continue; fi
      b=$(git -C "$d" branch --show-current)
      ab=$(git -C "$d" rev-list --left-right --count "@{u}...HEAD" 2>/dev/null | awk '{print "behind " $1 ", ahead " $2}')
      dirty=$([ -n "$(git -C "$d" status --porcelain)" ] && echo "dirty" || echo "clean")
      printf '%-30s %-10s %-22s %s\n' "$path" "$b" "${ab:-no upstream}" "$dirty"
    done ;;
  *) echo "usage: $0 clone|pull|status"; exit 1 ;;
esac
