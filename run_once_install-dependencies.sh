#!/usr/bin/env bash
# First successful chezmoi apply runs full install-deps.sh once; later applies skip immediately.
# Re-run manually: ./install-deps.sh or ./install-deps.sh sync-brew
# Force this hook again: rm -f ~/.local/state/chezmoi-dotfiles/install-deps-once.complete
set -e
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/chezmoi-dotfiles"
MARKER="$STATE_DIR/install-deps-once.complete"
if [[ -f "$MARKER" ]]; then
	exit 0
fi
SRC="${CHEZMOI_SOURCE_DIR:-}"
[[ -z "$SRC" ]] && {
	echo "CHEZMOI_SOURCE_DIR not set" >&2
	exit 1
}
[[ -f "$SRC/install-deps.sh" ]] || {
	echo "install-deps.sh not found in $SRC" >&2
	exit 1
}
mkdir -p "$STATE_DIR"
bash "$SRC/install-deps.sh"
touch "$MARKER"
