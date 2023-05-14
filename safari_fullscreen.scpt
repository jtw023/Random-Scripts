-- Applescript to launch browser and terminal side by side
-- when using markdown preview.
-- This script is called in $HOME/.config/nvim/lua/config/plug-markdown.lua

on run argv
    tell application "Safari"
        open location item 1 of argv
        activate
    end tell
    tell application "System Events"
        tell process "Safari"
            click menu item "Move Window to Left Side of Screen" of menu "Window" of menu bar 1
        end tell
    end tell
    tell application "kitty"
        activate
    end tell
    tell application "System Events"
        tell process "kitty"
            click menu item "Move Window to Right Side of Screen" of menu "Window" of menu bar 1
        end tell
    end tell
end run
