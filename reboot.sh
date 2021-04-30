#!/usr/bin/env bash
#
# This is a script to reboot your computer if you desire.
#
# What I use it for: I have it keybound to prompt me for a reboot.
#
# Tools used: rofi and reboot.

OPTIONS=("Yes\nNo")

CHOICE=$(printf ${OPTIONS[@]} | rofi -dmenu -p "Reboot?")

if [ $CHOICE = "Yes" ]; then
    reboot
elif [ $CHOICE = "No" ]; then
    exit 0
fi
