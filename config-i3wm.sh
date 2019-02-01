#!/bin/bash

PARENT_FOLDER=~/Code
DOTFILES_FOLDER=$PARENT_FOLDER/dotfiles

I3_CONFIG_FOLDER=~/.config
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -q
sudo apt-get upgrade -q -y
 
# depencies of i3-gaps
add-apt-repository ppa:aguignard/ppa -y
sudo apt-get update -q
sudo apt-get install -q -y   -o Dpkg::Options::="--force-confdef" \
                        -o Dpkg::Options::="--force-confold" \
git automake libtool libxcb-xrm0 libxcb-xrm-dev
 
sudo apt-get install -q -y   -o Dpkg::Options::="--force-confdef" \
                        -o Dpkg::Options::="--force-confold" \
libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
libxkbcommon-dev libxkbcommon-x11-dev autoconf
 
 
# install i3-gaps from source
 
# clone the repository
git clone https://www.github.com/Airblader/i3 $PARENT_FOLDER/i3-gaps
cd $PARENT_FOLDER/i3-gaps
# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install
 
# install misc. i3 packages
sudo apt-get install -q -y   -o Dpkg::Options::="--force-confdef" \
                        -o Dpkg::Options::="--force-confold" \
i3lock-fancy i3blocks i3status dmenu rofi dunst compton pulseaudio


# Linking configs
mv $I3_CONFIG_FOLDER/i3/ $I3_CONFIG_FOLDER/i3.bkp
mv $I3_CONFIG_FOLDER/i3status/ $I3_CONFIG_FOLDER/i3status.bkp
mv $I3_CONFIG_FOLDER/i3blocks/ $I3_CONFIG_FOLDER/i3blocks.bkp
mv $I3_CONFIG_FOLDER/rofi/ $I3_CONFIG_FOLDER/rofi.bkp
mv $I3_CONFIG_FOLDER/dunst/ $I3_CONFIG_FOLDER/dunst.bkp


ln -sd $DOTFILES_FOLDER/i3/ $I3_CONFIG_FOLDER/i3
ln -sd $DOTFILES_FOLDER/i3status/ $I3_CONFIG_FOLDER/i3status
ln -sd $DOTFILES_FOLDER/i3blocks/ $I3_CONFIG_FOLDER/i3blocks
ln -sd $DOTFILES_FOLDER/rofi/ $I3_CONFIG_FOLDER/rofi
ln -sd $DOTFILES_FOLDER/dunst/ $I3_CONFIG_FOLDER/dunst
