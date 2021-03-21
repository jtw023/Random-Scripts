#!/usr/bin/env fish

set CHOICE (ps -u jordan | rofi -dmenu -p "Kill a Process?" | awk '{print $4}')
killall "$CHOICE"
