#!/bin/bash

DIR=$(dirname "$0")

paru -S kmonad-bin xkb-switch-git --noconfirm --needed

bash "$DIR/copy_config.sh"

#sudo systemctl daemon-reload
#udo systemctl enable kmonad
#sudo systemctl start kmonad
