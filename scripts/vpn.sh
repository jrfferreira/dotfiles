#!/bin/bash

# nordvpn
yaourt -S nordvpn-bin
systemctl enable nordvpnd.service
systemctl start nordvpnd.service
