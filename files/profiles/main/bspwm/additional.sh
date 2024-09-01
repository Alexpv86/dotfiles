#!/bin/bash

mon_list=$(xrandr --listactivemonitors | tail -n +2 | awk {'print $4'})
mon_count=$(echo "${mon_list}" | wc -l)
mon_primary=$(echo -e "Выберите главный монитор:\n${mon_list}" | rofi -dmenu)

xrandr --output "${mon_primary}" --primary
polybar -r center &
bspc monitor "${mon_primary}" -d   󰖟 1 2 3

if [[ "${mon_count}" ]] >1; then
  mon_list=$(echo "${mon_list}" | grep -v "^${mon_primary}$")
  mon_left=$(echo -e "Выберите левый монитор:\n\n${mon_list}" | rofi -dmenu)
  mon_list=$(echo "${mon_list}" | grep -v "^${mon_left}$")
  mon_count=$(echo "${mon_list}" | wc -l)
fi
if [[ "${mon_count}" ]] >0; then
  mon_right=$(echo -e "Выберите правый монитор:\n\n${mon_list}" | rofi -dmenu)
fi

if [[ "${mon_left}" != "" ]]; then
  xrandr --output "${mon_left}" --left-of "${mon_primary}"
  polybar -r left &
  bspc monitor "${mon_left}" -d 4 5 6
fi
if [[ "${mon_right}" != "" ]]; then
  xrandr --output "${mon_right}" --right-of "${mon_primary}"
  polybar -r right &
  bspc monitor "${mon_right}" -d  8 9
fi
