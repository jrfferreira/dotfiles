#!/bin/bash

# nordvpn
set +e

git clone https://aur.archlinux.org/nordvpn-bin.git

set -e

cd nordvpn-bin

makepkg -scCi

systemctl enable nordvpnd.service
systemctl start nordvpnd.service

rm -rf nordvpn-bin
