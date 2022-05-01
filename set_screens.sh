#!/usr/bin/env bash
#
# This is a script that I have moved to /usr/local/bin/ in
# order for me to edit lightdm to run it on startup of my
# computer. It sets a secondary monitor to my primary screen
# with a monitor on either side of the primary.
#
# Tools used: xrandr.

xrandr --output "DP-2" --primary --mode 2560x1440 --rate 59.96 --output "DP-1" --mode 2560x1440 --rotate left --rate 59.95 --right-of "DP-2" --output "eDP-1" --mode 3072x1920 --rate 60.00 --left-of "DP-2" &
