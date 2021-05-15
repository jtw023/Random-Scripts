#!/usr/bin/env bash
#
# This is a script to see my torrent status.
#
# What I use it for: after adding an iso to my torrent
# client I run this script to check on the status.
#
# Tools used: clear, transmission-remote, sleep.

alacritty -e transmission-remote -l

while [ true ]
do
    clear
    transmission-remote -l
    sleep 5
done
