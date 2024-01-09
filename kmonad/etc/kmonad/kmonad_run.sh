#!/bin/bash

if [[ -e "/dev/input/by-id/platform-i8042-serio-o-event-kbd" ]]; then
    /sbin/kmonad "/etc/kmonad/gaming_kb_vb.kbd"
elif [[ -e "/dev/input/by-id/usb-Gaming_KB_Gaming_KB-event-kbd" ]]; then
    /sbin/kmonad "/etc/kmonad/gaming_kb.kbd"
fi
