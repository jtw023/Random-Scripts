#!/usr/bin/env bash

# This is a script that takes a git repo, deletes the repo on github,
# and then also deletes the repo on the local computer.

# What I use it for: I have it aliased in my zshrc as 'delete' for deleting
# a github repository.

# Tools used: gh, sleep, echo, curl, jq, rm

gh repo delete "$1" --yes
sleep 2
echo "Seeing if directory can safely be removed locally."
if [[ $(curl -s "https://api.github.com/repos/jtw023/$1" | jq -r ".message") == "Not Found" ]]; then
	echo "Removing directory."
	/bin/rm -rf "$1"
	echo "Directory removed."
fi
