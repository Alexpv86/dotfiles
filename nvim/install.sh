#!/bin/bash

paru -S neovim xclip ripgrep fd --noconfirm --needed

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
