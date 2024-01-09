#!/bin/bash

paru -S qutebrowser --noconfirm --needed

git clone https://github.com/dracula/qutebrowser-dracula-theme.git
mv dracula ~/.config/qutebrowser/
