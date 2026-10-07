#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIRS=(bash kitty lazygit nvim)
STOW_ARGS=()

if [[ "${1:-}" == "--dry-run" && $# -eq 1 ]]; then
    STOW_ARGS+=(--simulate)
elif [[ $# -gt 0 ]]; then
    printf 'Usage: %s [--dry-run]\n' "$0" >&2
    exit 2
fi

if ! command -v stow >/dev/null 2>&1; then
    echo "GNU Stow is required. Install it with: sudo apt-get install stow" >&2
    exit 1
fi

for package in "${STOW_DIRS[@]}"; do
    stow "${STOW_ARGS[@]}" --target="$HOME" --dir="$DOTFILES_DIR" "$package"
done

echo "Dotfiles linked into $HOME."