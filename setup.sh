#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_FILE="$SCRIPT_DIR/packages/debian.txt"
DRY_RUN=0

if [[ "${1:-}" == "--dry-run" && $# -eq 1 ]]; then
    DRY_RUN=1
elif [[ $# -gt 0 ]]; then
    printf 'Usage: %s [--dry-run]\n' "$0" >&2
    exit 2
fi

if [[ ! -r /etc/os-release ]]; then
    echo "Cannot identify this operating system (/etc/os-release is missing)." >&2
    exit 1
fi

. /etc/os-release
if [[ "${ID:-}" != "debian" ]]; then
    printf 'This installer supports Debian only; detected %s.\n' "${PRETTY_NAME:-unknown}" >&2
    exit 1
fi

if [[ ! -r "$PACKAGE_FILE" ]]; then
    printf 'Package manifest not found: %s\n' "$PACKAGE_FILE" >&2
    exit 1
fi

packages=()
while IFS= read -r package || [[ -n "$package" ]]; do
    [[ "$package" =~ ^[[:space:]]*($|#) ]] && continue
    packages+=("$package")
done < "$PACKAGE_FILE"

if [[ ${#packages[@]} -eq 0 ]]; then
    echo "The Debian package manifest is empty." >&2
    exit 1
fi

if (( DRY_RUN )); then
    printf 'Would run: sudo apt-get update\n'
    printf 'Would install: sudo apt-get install --yes'
    printf ' %q' "${packages[@]}"
    printf '\nWould run: bash %q\n' "$SCRIPT_DIR/dotfiles/stow.sh"
    exit 0
fi

sudo apt-get update
sudo apt-get install --yes --no-install-recommends "${packages[@]}"
bash "$SCRIPT_DIR/dotfiles/stow.sh"

echo "Setup complete. Start a new shell session to load the Bash configuration."