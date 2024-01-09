#!/bin/bash

DIR=$(dirname "$0")
sudo cp "$DIR/00-keyboard.conf" /etc/X11/xorg.conf.d/
sudo cp "$DIR/group" /usr/share/X11/xkb/symbols/
