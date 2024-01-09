#!/bin/bash

DIR=$(dirname "$0")
cp -r "$DIR/.config" ~
cp "$DIR/.xinitrc" ~
bash "$DIR/restart.sh"
