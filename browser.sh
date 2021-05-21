#!/usr/bin/env bash
#
# This is a script for choosing which web browser to launch.
#
# What I use it for: I have a keybinding to this script which
# launches rofi, asks which web browser I would like to open,
# and then opens my choice.
#
# Tools used: rofi.

BROWSER_LIST=("LibreWolf(Default)" "Brave(Video and USG)" "Qutebrowser(Youtube)")

CHOICE=$(printf '%s\n' "${BROWSER_LIST[@]}" | rofi -dmenu -i -p "Which Browser?")

if [[ $CHOICE = "LibreWolf(Default)" ]]; then

    librewolf

elif [[ $CHOICE = "Brave(Video and USG)" ]]; then

    brave

elif [[ $CHOICE = "Qutebrowser(Youtube)" ]]; then

    qutebrowser

fi
