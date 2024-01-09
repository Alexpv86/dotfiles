#!/bin/bash

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin || exit
makepkg -si

paru -S xorg-xrandr ttf-jetbrains-mono-nerd --noconfirm --needed
