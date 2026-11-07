#!/bin/sh
# Check the vault's links and indexes.
# Usage: sh .agent/check.sh (from the vault root)
# Reports broken links, files with more than one parent, cycles, and folders without index.md.

cd "${1:-$(dirname "$0")/..}" || exit 1
export LC_ALL=C
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
tab=$(printf '\t')

find . -path ./.obsidian -prune -o -path ./.agent -prune -o -path ./.git -prune -o \
  -type f \( -name '*.md' -o -name '*.canvas' \) -print | sed 's#^\./##' | sort > "$tmp/files"

# Every link as "source<TAB>target". Code blocks and inline code are skipped.
while IFS= read -r f; do
  case $f in
    *.canvas) grep -o '"file": *"[^"]*"' "$f" | sed 's/.*"file": *"//; s/"$//' ;;
    *) awk '/^```/ { code = !code; next } !code' "$f" | sed 's/`[^`]*`//g' |
         grep -o '\[\[[^]|#\\]*' | sed 's/^\[\[//' ;;
  esac | while IFS= read -r t; do printf '%s\t%s\n' "$f" "$t"; done
done < "$tmp/files" > "$tmp/raw"

: > "$tmp/edges"
while IFS="$tab" read -r s t; do
  if [ -f "$t" ]; then r=$t
  elif [ -f "$t.md" ]; then r=$t.md
  else echo "BROKEN    $s -> $t"; continue
  fi
  [ "$r" = "$s" ] || printf '%s\t%s\n' "$s" "$r" >> "$tmp/edges"
done < "$tmp/raw"
sort -u "$tmp/edges" -o "$tmp/edges"

cut -f2 "$tmp/edges" | sort | uniq -d | while IFS= read -r t; do
  echo "PARENTS   $t <- $(awk -F"$tab" -v t="$t" '$2 == t { printf "%s%s", sep, $1; sep = ", " }' "$tmp/edges")"
done

awk -F"$tab" '
  { adj[$1] = adj[$1] SUBSEP $2; node[$1]; node[$2] }
  function visit(n,   i, k, next_) {
    state[n] = 1
    k = split(adj[n], next_, SUBSEP)
    for (i = 2; i <= k; i++) {
      if (state[next_[i]] == 1) print "CYCLE     " n " -> " next_[i]
      else if (!state[next_[i]]) visit(next_[i])
    }
    state[n] = 2
  }
  END { for (n in node) if (!state[n]) visit(n) }
' "$tmp/edges"

find . -path ./.obsidian -prune -o -path ./.agent -prune -o -path ./.git -prune -o \
  -path ./3-Discussions -prune -o -type d -print | while IFS= read -r d; do
  [ -f "$d/index.md" ] || echo "NO INDEX  ${d#./}"
done

cut -f2 "$tmp/edges" | sort -u > "$tmp/targets"
echo "files $(wc -l < "$tmp/files" | tr -d ' '), links $(wc -l < "$tmp/edges" | tr -d ' ')"
echo "roots: $(comm -23 "$tmp/files" "$tmp/targets" | tr '\n' ' ')"
