#!/bin/bash

# tumbler for preview image
paru -S thunar thunar-volman gvfs thunar-archive-plugin thunar-media-tags-plugin tumbler --noconfirm --needed

# icons
git clone https://github.com/alvatip/Nordzy-icon
if [[ -d "Nordzy-icon" ]]; then
    cd Nordzy-icon || exit
    bash install.sh
    cd ..
    rm -rf Nordzy-icon
else
    echo "Warning! Nordzy-icon not installed."
fi

# theme
git clone https://github.com/EliverLara/Nordic.git
if [[ -d "Nordic" ]]; then
    mkdir ~/.themes
    mv Nordic ~/.themes/Nordic
else
    echo "Warning! Nordic theme not installed."
fi
