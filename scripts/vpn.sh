#!/bin/bash

# nordvpn
set +e

git clone https://aur.archlinux.org/nordvpn-bin.git

set -e

cd nordvpn-bin

sudo pacman -S --noconfirm fakeroot

makepkg -scCi

sudo systemctl enable --now nordvpnsd
systemctl --user enable --now nordvpnud

sudo systemctl enable nordvpnd.service
systemctl start nordvpnd.service
