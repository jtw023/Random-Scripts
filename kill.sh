#!/usr/bin/env bash
#
# This is a script that lets you kill an open program.
#
# I have a keybinding to it to kill any program that is no
# longer responding.
#
# Tools used: ps, rofi, awk, killall, and notify-send.

CHOICE=$(ps -u $USER | rofi -dmenu -p "Kill a process? " | awk '{print $4}')
killall "$CHOICE"
notify-send "$CHOICE was killed"
