#!/usr/bin/env bash

choice=$(fc-list | awk '{print $1}' | sed 's/://g' | rofi -dmenu -i -p "Choose a font: ")
display "$choice"
