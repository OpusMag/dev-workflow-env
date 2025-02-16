#!/bin/bash

# An exit if something fails
set -e

# Need to update the sources list so we can get Deb testing
echo "Updating sources list to Debian testing..."
sudo sed -i 's/stable/testing/g' /etc/apt/sources.list
sudo sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list

# Upgrading to debian testing to get newer packages
echo "Updating system to debian testing..."
sudo apt update && sudo apt full-upgrade -y # it fails unless it's a full upgrade

# Getting packages from another file because the list is looong
echo "Installing additional packages..."
xargs -a package-list.txt sudo apt install -y

# TODO: setup git

DOTFILES_REPO="https://github.com/OpusMag/dev-workflow-env.git"
DOTFILES_DIR="$HOME/dev-workflow-env/dotfiles"

# Running an install script so i don't have to deal with stowing
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Cloning dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
    ./stow.sh
fi

# TODO: Setup neovim config

# Need to reload shell for changes to take effect
echo "Reloading shell configuration..."
source ~/.bashrc

echo "Setup complete! Please reboot for changes to take effect."