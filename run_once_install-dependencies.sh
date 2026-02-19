#!/usr/bin/env bash
# Run once by chezmoi; invokes the main dependency installer from the source dir.
set -e
SRC="${CHEZMOI_SOURCE_DIR:-}"
[[ -z "$SRC" ]] && { echo "CHEZMOI_SOURCE_DIR not set" >&2; exit 1; }
[[ -x "$SRC/install-deps.sh" ]] || { echo "install-deps.sh not found in $SRC" >&2; exit 1; }
exec "$SRC/install-deps.sh"
