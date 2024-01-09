#!/bin/bash

DIR=$(dirname "$0")

sudo cp "$DIR/etc/pacman.conf" /etc/
sudo cp "$DIR/etc/paru.conf" /etc/
sudo cp "$DIR/etc/environment" /etc/

sudo cp "$DIR/xorg/00-keyboard.conf" /etc/X11/xorg.conf.d/
sudo cp "$DIR/xorg/group" /usr/share/X11/xkb/symbols/
