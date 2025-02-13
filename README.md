# Developer workflow environment
This is a guide for myself for when I set up a new system (or bork the one I have)

Step 1.

What distro to choose? 

Debian (stable for work, upgrade to testing at home or if in dependancy hell): https://www.debian.org/distrib/

Arch was nice to run because of the rolling releases, but sadly not viable due to some proprietary software necessary for work that doesn't support it.

Desktop environment: 

GNOME if I don't feel like customizing or KDE Plasma if I want to get everything just right. It's nice to have a desktop environment when you have to deal with Teams, screensharing and other things that don't play well with a tiling window manager. Need to install dconf-cli in order to import gnome settings. Use dconf load < gnome-settings.ini and the settings should be loaded.

Installing dotfiles and packages: GNU stow is used to manage dotfiles and allow for easy redeployment of a system. In addition a list of packages is available in the repo in order to easily reinstall all the packages. in order to install the packages use  'sudo dpkg --set-selections < ~/package-list.txt' and 'sudo apt install dselect-upgrade' and the packages should be installed. This may not work correctly, so just look at the list of packages and get the most essential ones manually. Stow might also not work. In that case, just copy over the config files to the correct directories. In addition, lazyvim, lazygit, vscode, discord and vmware need to be installed manually.

TODO: Look further into streamlining this process more, so it's easier when setting up a new system.

Tiling window manager for max productivity:

Awesome: https://awesomewm.org/

Themes for awesome: https://github.com/Relz/awesome-wm-theme and https://github.com/lcpz/awesome-copycats 

Previously ran i3. This required a lot of configuring and tinkering. Awesome on the other hand runs out of the box and feels easier to deal with.

Locking the screen: https://askubuntu.com/questions/1070657/awesome-wm-how-do-you-set-a-hotkey-to-lock-your-system

Text editor/IDE:

VScode (with vim motions): Nice to have when you don't feel like being a keyboard wizard, need to pair program with a colleague or you've borked your Neovim doing something stupid.

Neovim:

Lazyvim (because I'm lazy): https://www.lazyvim.org/

Dependencies:

Nerdfonts: https://www.nerdfonts.com/

Luajit: http://luajit.org/

Kitty terminal: https://sw.kovidgoyal.net/kitty/

Kitty themes: https://github.com/dexpota/kitty-themes

CLI tools:

GNU Stow: https://www.gnu.org/software/stow/

Lazygit: https://github.com/jesseduffield/lazygit

What-cmd: https://github.com/OpusMag/what-cmd

Thefuck: https://github.com/nvbn/thefuck

Zoxide: https://github.com/ajeetdsouza/zoxide

Tldr: https://github.com/tldr-pages/tldr

Exa: https://github.com/ogham/exa

Bat: https://github.com/sharkdp/bat

Fzf: https://github.com/junegunn/fzf

Procs: https://github.com/dalance/procs

Now there are a thousand small steps inbetween these big ones and a lot of dependencies not mentioned, but they'll become apparant when walking through the steps. At this point, replacing the config files with the ones in this repo is the last step. After that, the system should be pretty much ready to go.
