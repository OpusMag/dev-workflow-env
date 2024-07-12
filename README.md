# Div-config-files
config files for stuff

How to setup environment for ubuntu:

First you'll obviously have to install latest ubuntu version

Then, since audio is nice, you'll install 

Pulseaudio and pavucontrol (might already be there, try launching first)

Then you'll install i3 and customize for tile window management:

(download the config file here first and see if it looks OK. If it, refer to the link below for guidance on customization)
https://itsfoss.com/i3-customization/

(download the config file here first and see if it looks OK. If it doesn't, refer to the link below for guidance on customization)
Then i3lock-color to customize the lock screen

https://github.com/Raymo111/i3lock-color

Then polybar to create a status bar and customize it
(download the config and customize from that if necessary)

Using the config files for i3, polybar etc should get you up and running, but you may need some dependencies and a refresh on how to customize so
refer to Kthulhu120/i3wm-theme repo and look at the manual guide there for how to customize your colors. Please for all that is unholy, don't try to run the scripts, it will result in you having to reinstall ubuntu.


Then it's time to install lazyvim, which has a bunch of dependencies

https://www.lazyvim.org/

The main ones are a nerd font, Luajit, lazygit and kitty.

Luajit info here: file:///home/magnus/luajit/doc/luajit.html

Then it's a good time to replace the default config files for your own. The necessary config files are in this repo.
