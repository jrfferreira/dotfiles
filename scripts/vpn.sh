#!/bin/bash

set -e

# nordvpn
git clone https://aur.archlinux.org/nordvpn-bin.git
cd nordvpn-git
makepkg -scCi

systemctl enable nordvpnd.service
systemctl start nordvpnd.service
