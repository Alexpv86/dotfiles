#!/bin/bash

paru -S qutebrowser --noconfirm --needed

git clone https://github.com/dracula/qutebrowser-dracula-theme.git
mkdir -p ~/.config/qutebrowser
mv qutebrowser-dracula-theme ~/.config/qutebrowser/dracula
