#!/usr/bin/env bash

# This is a script that takes a name and then creates a directory with that name,
# initializes the directory for git, and then creates a github repo using the
# github cli tool.

# What I use it for: I have it aliased in my zshrc as 'create' for creating
# a github repository.

# Tools used: gh, mkdir, cd, git, touch, echo

DIRECTORY_NAME="/Users/jordanwalters/github_repos/$1"

mkdir -pv "$DIRECTORY_NAME"
cd "$DIRECTORY_NAME"
git init
touch README.md
echo "Initialized Repository" >> README.md
git add .
git commit -m "Initial Commit"
gh repo create "$1" --public --source=. --remote=upstream --push
