#!/usr/bin/env bash

CHOICE=$(ps -u $USER | rofi -dmenu -p "Kill a process? " | awk '{print $4}')
killall "$CHOICE"
notify-send "$CHOICE was killed"
