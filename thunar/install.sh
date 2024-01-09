#!/bin/bash

# tumbler for preview image
paru -S thunar thunar-volman gvfs thunar-archive-plugin thunar-media-tags-plugin tumbler --noconfirm --needed

# icons
git clone git clone https://github.com/alvatip/Nordzy-icon
./Nordzy-icon/install.sh
rm -rf Nordzy-icon

# theme
git clone https://github.com/EliverLara/Nordic.git
mkdir ~/.themes
mv Nordic ~/.themes/Nordic
