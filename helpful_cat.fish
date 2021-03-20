#!/usr/bin/env fish

echo "Update: 'upd' Add: '-S' Search: '-Ss' Remove: '-Rns' List: '-Qe'
Find Orphans: 'pacman -Qdtq' Remove Orphans: 'pacman -R (pacman -Qdtq)'
Remove File: 'srm' Remove Directory: 'srmd'" | lolcat
