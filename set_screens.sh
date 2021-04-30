#!/usr/bin/env bash
#
# This is a script that I have moved to /usr/local/bin/ in
# order for me to edit lightdm to run it on startup of my
# computer. It sets a secondary monitor to my primary screen
# with a monitor on either side of the primary.
#
# Tools used: xrandr.

xrandr --output "DP-1-0" --primary --mode 1920x1080 --rate 60.00 --output "eDP-1" --mode 1920x1080 --rate 144.00 --right-of "DP-1-0" --output "DP-1-2" --mode 1600x900 --rate 59.95 --left-of "DP-1-0"
