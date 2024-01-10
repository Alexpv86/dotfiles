#!/bin/bash

paru -S neovim xclip --noconfirm --needed

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
