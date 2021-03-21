#!/usr/bin/env bash

OPTIONS=("Yes\nNo")

CHOICE=$(printf ${OPTIONS[@]} | rofi -dmenu -p "Poweroff?")

if [ $CHOICE = "Yes" ]; then
    poweroff
elif [ $CHOICE = "No" ]; then
    exit 0
fi


