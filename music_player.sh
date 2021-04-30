#!/usr/bin/env bash
#
# This is a script for launching mpv as a music player.
#
# What I use it for: I have a keybinding to this script which
# launches a terminal, runs mpv with the shuffle command in my
# music directory, and then closes the terminal while mpv is
# still playing.
#
# Tools used: devour, mpv.

devour mpv --no-resume-playback --shuffle /home/$USER/download/Playlist/all\ songs/
