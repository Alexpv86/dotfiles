#!/bin/bash

DIR=$(dirname "$0")

mkdir -p ~/.config/alacritty
cp "$DIR/alacritty.toml" ~/.config/alacritty
