#!/bin/bash

xrandr --output Virtual1 --mode 2560x1440

bspc monitor Virtual1 -d   󰖟 1 2 3

bspc rule -a 'VirtualBox Manager' desktop='' follow=on
