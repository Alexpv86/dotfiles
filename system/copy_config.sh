#!/bin/bash

DIR=$(dirname "$0")

sudo cp "$DIR/pacman.conf" /etc/
sudo cp "$DIR/paru.conf" /etc/
sudo cp "$DIR/environment" /etc/
