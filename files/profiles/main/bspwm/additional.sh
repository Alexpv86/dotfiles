#!/bin/bash

mon_list=$(xrandr --listactivemonitors | tail -n +2 | awk {'print $4'})
mon_count=$(echo ${mon_list} | wc -l)
mon_primary=$(echo ${mon_list} | rofi -dmenu)

xrandr --output ${mon_primary} --primary
polybar -r center &
bspc monitor ${mon_primary} -d   󰖟 1 2 3

# if [[ ${mon_count} > 1 ]]; then
#   xrandr --output DVI-D-0 --left-of HDMI-0
#   polybar -r left &
#   bspc monitor DVI-D-0 -d 4 5 6
# fi
#polybar -r right &

# bspc monitor DVI-I-1 -d  8 9
