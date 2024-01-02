#!/bin/bash

DIR=$(dirname $0)

paru -S qutebrowser

git clone https://github.com/dracula/qutebrowser-dracula-theme.git
mv dracula ~/.config/qutebrowser/
cp -r $DIR/.config.py ~/.config/qutebrowser/
