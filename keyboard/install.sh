#!/bin/bash

DIR=$(dirname $0)
sudo cp "$DIR/00-keyboard.conf" /etc/X11/xorg.conf.d/00-keyboard.conf

xkb_symbols "swapescape" {
    key <CAPS> { [ Escape ] };
    key <ESC>  { [ Caps_Lock ] };
};