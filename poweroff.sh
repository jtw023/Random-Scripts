#!/usr/bin/env bash
#
# This is a script to shutdown your computer if desired.
#
# What I use it for: I have it keybound to prompt me to power down
# the computer.
#
# Tools used: rofi and poweroff.

OPTIONS=("Yes\nNo")

CHOICE=$(printf ${OPTIONS[@]} | rofi -dmenu -p "Poweroff?")

if [ $CHOICE = "Yes" ]; then
    poweroff
elif [ $CHOICE = "No" ]; then
    exit 0
fi


