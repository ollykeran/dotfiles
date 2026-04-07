#!/usr/bin/env bash
# Sync Homebrew to match repo Brewfile exactly: install/upgrade listed deps, remove the rest.
# Run from anywhere: bash /path/to/repo/scripts/sync-homebrew.sh
# Escape hatch: BREW_BUNDLE_SKIP_CLEANUP=1 keeps packages not in the Brewfile.
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${HOME}/.local/bin"
export PATH="$BIN_DIR:$PATH"
# shellcheck source=../dot_bash_functions
source "${REPO_ROOT}/dot_bash_functions"
sync_homebrew_bundle "$REPO_ROOT"
