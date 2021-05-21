#!/usr/bin/env bash
#
# This is a script for launching mpv as a music player.
#
# What I use it for: I have a keybinding to this script which
# launches a terminal, promps with rofi which directory to
# source music from, and runs mpv with the shuffle command in
# that music directory. Then it also closes the terminal while
# mpv is playing.
#
# Tools used: rofi, devour, and mpv.

MUSIC_LIST=("Lyrical Playlist" "Instrumental Playlist")

CHOICE=$(printf '%s\n' "${MUSIC_LIST[@]}" | rofi -dmenu -i -p "Choose a playlist: ")

if [[ $CHOICE = "Lyrical Playlist" ]]; then

    devour mpv --no-resume-playback --shuffle /home/$USER/Music/lyrical\ music/

elif [[ $CHOICE = "Instrumental Playlist" ]]; then

    devour mpv --no-resume-playback --shuffle /home/$USER/Music/instrumental\ music/

fi
