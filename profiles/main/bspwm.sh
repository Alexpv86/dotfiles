#!/bin/bash

xrandr --output DVI-D-0 --left-of HDMI-0

polybar -r center &
polybar -r left &
#polybar -r right &

bspc monitor HDMI-0 -d   󰖟 1 2 3
bspc monitor DVI-D-0 -d 4 5 6
# bspc monitor DVI-I-1 -d  8 9
