#!/usr/bin/env bash
#
# This is a script to take a screenshot of the area that you
# highlight and then save it to a directory called pictures.
#
# What I use it for: I have a keybinding to this script inside
# of my qtile config file which then brings up a cursor for me to
# highlight an area before it takes the screenshot and automatically
# saves it to my pictures directory.
#
# Tools used: flameshot and notify-send.

flameshot gui -p /home/$USER/Pictures
