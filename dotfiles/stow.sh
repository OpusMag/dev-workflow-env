#!/bin/bash

# An exit if something fails
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# May expand this when I think of more things to stow
STOW_DIRS="bash gnome kitty lazygit nvim"

# Using stow atm, maybe chezmoi down the road?
echo "Stowing"
cd "$DOTFILES_DIR"
for dir in $STOW_DIRS; do
    stow -t ~ "$dir"
done

echo "Dotfiles setup complete!"