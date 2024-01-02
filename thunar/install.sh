#!/bin/bash

paru thunar thunar-volman gvfs

# icons
git clone git clone https://github.com/alvatip/Nordzy-icon
./Nordzy-icon/install.sh
rm -rf Nordzy-icon

# theme
git clone https://github.com/EliverLara/Nordic.git
mkdir ~/.themes
mv Nordic ~/.themes/Nordic
