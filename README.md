# Debian Developer Environment

This repository collects the packages and user configuration I use on a new Debian workstation. The supported baseline is Debian stable. The installer does not change APT sources, upgrade the release, configure third-party repositories, or import desktop settings automatically.

## Install

Clone the repository, review the package manifest, and run the installer:

```sh
git clone https://github.com/OpusMag/dev-workflow-env.git
cd dev-workflow-env
bash setup.sh --dry-run
bash setup.sh
```

The dry run lists the packages and Stow operation without changing the system. The normal run updates APT, installs the packages in `packages/debian.txt`, then uses GNU Stow to link the Bash aliases, Kitty, and Neovim configurations into your home directory. Bash customizations are installed as `~/.bash_aliases`, which the standard Debian `~/.bashrc` sources; the installer does not replace your existing `~/.bashrc`. Run it from any working directory; paths are resolved relative to the script.

Stow stops if a destination already exists and is not the expected symlink. Back up or move conflicting files before retrying; the installer does not delete or replace existing configuration. If you already maintain `~/.bash_aliases`, merge it with `dotfiles/bash/.bash_aliases` before stowing the Bash package. The package list is a curated baseline, not a complete export of every package on a particular machine. Package availability can change between Debian releases.

## Repository Layout

- `packages/debian.txt`: Debian package names, one per line; comments and blank lines are ignored.
- `setup.sh`: Debian check, package installation, and call to the Stow script.
- `dotfiles/stow.sh`: links the selected Stow packages into `$HOME`.
- `dotfiles/bash/`, `dotfiles/kitty/`, `dotfiles/nvim/`: canonical user configuration sources; Bash provides additive aliases rather than a replacement `.bashrc`.
- Lazygit is installed as a package, but its empty config and machine-specific state are not managed here.
- `dotfiles/gnome/dconf-settings.ini`: optional GNOME settings snapshot; not installed by Stow or the setup script.
- `backgrounds/`: wallpapers used by the desktop configuration.
- `keybinds/`: keyboard layout exports and a Neovim command reference; these files are not installed or modified by the setup scripts.
- `.config/`: convenience symlinks into the canonical Stow packages; edit the files under `dotfiles/`.

## Optional GNOME Settings

The dconf file is a snapshot from one Ubuntu desktop. It contains user-specific paths, Ubuntu schemas, and theme names that may not exist on Debian. Review and adjust it before importing it from a running GNOME session:

```sh
dconf load / < dotfiles/gnome/dconf-settings.ini
```

Importing the snapshot changes settings across multiple GNOME applications. It is not a portable default profile and is intentionally excluded from the unattended install.

## Manual Applications

Applications that need vendor repositories or separate installers are not included in the Debian package manifest. Install VS Code, Discord, VMware, and any preferred Nerd Font using their upstream instructions. LazyVim plugins install on the first Neovim launch; the repository includes the Neovim configuration, not a separate Neovim binary installer.

Some tools named in older notes (such as `what-cmd`, `thefuck`, and `tldr`) are not part of the curated Debian package set. Add them only after checking their current Debian availability and installation method.

## Dotfile Manager

This repository uses GNU Stow because the maintained configuration is static and already organized as Stow packages. A second manager would add migration work without solving a current need. Revisit that choice if configurations need host-specific templates, encrypted secrets, or managed machine-to-machine state.

## Maintenance

Keep one maintained copy of each user configuration under `dotfiles/` and update `packages/debian.txt` when the baseline changes. Check the package plan with `bash setup.sh --dry-run` and the Stow plan with `bash dotfiles/stow.sh --dry-run`.

To test real Stow links without changing your home directory, use a temporary target:

```sh
temp_home=$(mktemp -d)
trap 'rm -rf "$temp_home"' EXIT
HOME="$temp_home" bash dotfiles/stow.sh
test -L "$temp_home/.bash_aliases"
test -L "$temp_home/.config/kitty/kitty.conf"
test -L "$temp_home/.config/kitty/theme.conf"
test -L "$temp_home/.config/nvim/init.lua"
```

This verifies config linking, including Kitty's theme file, but does not install APT packages. The package installation has not been tested on a fresh Debian VM; do that before relying on this repository for a new-system setup.
