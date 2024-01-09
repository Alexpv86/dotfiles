#!/bin/bash

if [[ ! $(command -v paru) ]]; then
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin || exit
    makepkg -si
fi

paru -S xorg-xrandr lxappearance qt5ct awesome-terminal-fonts --noconfirm --needed
