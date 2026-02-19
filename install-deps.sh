#!/usr/bin/env bash
# Idempotent dependency installer for dotfiles.
# Order: chezmoi (+ config) -> eget -> system packages -> font -> eget binaries -> Go -> go install -> Rust -> cargo install -> NvChad.
#
# Run from repo root: ./install-deps.sh then: chezmoi apply
# Package lists: deb_pkgs.txt, dnf_pkgs.txt, eget_pkgs.txt, go_pkgs.txt, cargo_pkgs.txt (one entry per line).
# Eget: uses --system linux/amd64 and excludes static/musl by default. Set EGET_EXTRA e.g. to '--asset .tar' to prefer tarballs only.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
EGET_SHA256="0e64b8a3c13f531da005096cc364ac77835bda54276fedef6c62f3dbdc1ee919"
BIN_DIR="${HOME}/.local/bin"
FONT_DIR="${HOME}/.local/share/fonts"
NERD_FONTS_VERSION="v3.1.1"
NVIM_CONFIG="${HOME}/.config/nvim"

# Install functions live in dot_bash_functions (sourced below).
[[ -f "${REPO_ROOT}/dot_bash_functions" ]] && source "${REPO_ROOT}/dot_bash_functions"

main() {
	install_log "Ensure $BIN_DIR is on PATH for this script"
	export PATH="$BIN_DIR:$PATH"
	install_chezmoi
	install_eget
	install_system_packages
	install_font
	install_eget_binaries
	install_starship
	install_go_tools
	install_rust_tools
	install_nvchad
	install_bash_ls
	install_log "Done. Add $BIN_DIR and $HOME/go/bin to PATH if needed."
	install_log "Then run: chezmoi apply   (config is at ~/.config/chezmoi/chezmoi.toml, sourceDir = $REPO_ROOT)"
}

main "$@"
