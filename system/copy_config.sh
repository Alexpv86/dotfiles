#!/bin/bash

DIR=$(dirname "$0")

sudo cp "$DIR/etc/pacman.conf" /etc/
sudo cp "$DIR/etc/paru.conf" /etc/
sudo cp "$DIR/etc/environment" /etc/
