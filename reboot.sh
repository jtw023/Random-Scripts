#!/usr/bin/env bash

OPTIONS=("Yes\nNo")

CHOICE=$(printf ${OPTIONS[@]} | rofi -dmenu -p "Reboot?")

if [ $CHOICE = "Yes" ]; then
    reboot
elif [ $CHOICE = "No" ]; then
    exit 0
fi
