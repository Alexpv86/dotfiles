#!/bin/bash

DIR=$(dirname "$0")

mkdir ~/.config/alacritty
cp "$DIR/alacritty.toml" ~/.config/alacritty
