-- Applescript to zoom terminal after using markdown preview.
-- This script is called in $HOME/.config/nvim/lua/config/autocommands.lua

activate application "kitty"
tell application "System Events" to keystroke "z" using {control down, command down, option down}
