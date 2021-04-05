#!/usr/bin/env bash

CHOICE=$(ps -u jordan | rofi -dmenu -p "Kill a process? " | awk '{print $4}')
killall "$CHOICE"
notify-send "$CHOICE was killed"
