# dotfiles.elecfist
This is a collection of my dotfiles.
There are two bash scripts that allow for automation of backup and re-deployment
In the future there would be more addition to this.

# ESSENTIAL PACKAGES
*firmware-amd-graphics
*firmware-iwlwifi
firmware-linux
firmware-misc-nonfree
firmware-realtek
intel-microcode
*libgl1-mesa-dri
*xserver-xorg-video-ati

# Core packages
ibus-teni (from github)
/opt: fzf, nvim (appimage)
docker (.sh script)
github: lightdm-mini-greeter
im-config, zenity
keepassxc
redshift
fonts-roboto

# create symbolic link for nvim
sudo mkdir /opt/neovim
sudo mv $HOME/Downloads/nvim.appimage /opt/neovim/
sudo ln -s /opt/neovim/nvim.appimage /usr/bin/nvim

# config lightdm
https://github.com/prikhi/lightdm-mini-greeter#configure
# lighdm modification file
/etc/lightdm/lightdm-gtk-greeter.conf
/etc/lightdm/lightdm-mini-greeter.conf

# ibus
config im-config to use ibus, then add ibus-teni

# disabe auto turnon of Bluetooth
/etc/bluetooth/main.conf:96 AutoEnable=false

# create root password
sudo passwd root

# change icons, font, themes, config dualboot clock

# enable booting debug message
/etc/default/grub:9 GRUB_CMDLINE_LINUX_DEFAULT=""

# disable external AMD card
/etc/default/grub:9 GRUB_CMDLINE_LINUX_DEFAULT="radeon.modeset=0"



# set firefox to use its own colour, NOT system colour

