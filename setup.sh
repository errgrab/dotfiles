#!/bin/sh
set -eu

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

link_path() {
	rel=$1
	src=$SCRIPT_DIR/$rel
	dst=$HOME/$rel

	if [ ! -e "$src" ]; then
		printf 'Warning: "%s" not found in repo, skipping\n' "$rel" >&2
		return
	fi
	
	mkdir -p "$(dirname "$dst")"

	if [ -L "$dst" ] || [ -f "$dst" ]; then
		rm -f "$dst"
	elif [ -d "$dst" ]; then
		rm -rf "$dst"
	fi

	ln -s "$src" "$dst"
	printf 'Linked: %s -> %s\n' "$dst" "$src"
}

if [ $# -eq 0 ]; then
	find . -path './.git' -prune -o -type -f -print | while IFS= read -r f; do
		rel=${f#./}
		link_path "$rel"
	done
else
	for p in "$@"; do
		rel=${p#./}
		link_path "$rel"
	done
fi
