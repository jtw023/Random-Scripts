#!/usr/bin/env bash
#
# This is a script to view fonts that you have
# installed on your system with a tool called
# 'display' from imagemagick.
# 
# Tools used: fc-list, awk, sed, rofi, and
# display.

choice=$(fc-list | awk '{print $1}' | sed 's/://g' | rofi -dmenu -i -p "Choose a font: ")
display "$choice"
