#!/bin/bash

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si

sudo cp {pacman,paru}.conf /etc/

paru -S xorg-xrandr ttf-jetbrains-mono-nerd
