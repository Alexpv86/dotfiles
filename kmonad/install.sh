#!/bin/bash

DIR=$(dirname "$0")

paru -S kmonad-bin --noconfirm --needed

bash "$DIR/copy_config.sh"

sudo systemctl daemon-reload
sudo systemctl enable kmonad
sudo systemctl start kmonad
