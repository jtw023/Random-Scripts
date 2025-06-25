#!/usr/bin/env bash

# This is a script that takes a name and then creates a directory with that name,
# initializes the directory for git, and then creates a github repo using the
# github cli tool.

# What I use it for: I have it aliased in my zshrc as 'create' for creating
# a github repository.

# Tools used: gh, mkdir, cd, git, touch, echo, exit, break, read, select

CURRENT_DIRECTORY=$(pwd)

echo -e "\nWhat would you like to do with this new repository?"
select CHOICE1 in "Create Inside New Directory" "Create Inside Existing Directory" "Exit"; do
   if [[ $CHOICE1 == "Exit" ]]; then
       exit 0
   fi
   break
done


if [[ $CHOICE1 == "Create Inside Existing Directory" ]]; then
    echo -e "\nWould you like this new repository to be in the home folder or current directory?"
    select CHOICE2 in "Home Folder" "Current Directory" "Exit"; do
       if [[ $CHOICE2 == "Exit" ]]; then
           exit 0
       fi
        break
    done
    if [[ $CHOICE2 == "Home Folder" ]]; then
        if [[ ! -f "$HOME/$1" ]] && [[ ! -d "$HOME/$1" ]]; then
            echo -e "\e[32m✓ \e[0m Creating new repo called $HOME/$1"
            mkdir -p "$HOME/$1"
            cd "$HOME/$1"
            git init
            touch README.md
            echo "Repository Initialized" >> README.md
            git add .
            git commit -m "Batman"
            gh repo create "$1" --public --source=. --remote=upstream --push
            echo -e "\e[32m✓ \e[0m Repo created, exiting."
            exit 0
        else
            echo -e "\e[31m \e[0m That name already exists in the home folder, exiting."
            exit 0
        fi
    fi
    if [[ $CHOICE2 == "Current Directory" ]]; then
        if [[ ! -f "$CURRENT_DIRECTORY/$1" ]] && [[ ! -d "$CURRENT_DIRECTORY/$1" ]]; then
            echo -e "\e[32m✓ \e[0m Creating new repo called $CURRENT_DIRECTORY/$1"
            mkdir -p "$CURRENT_DIRECTORY/$1"
            cd "$CURRENT_DIRECTORY/$1"
            git init
            touch README.md
            echo "Repository Initialized" >> README.md
            git add .
            git commit -m "Batman"
            gh repo create "$1" --public --source=. --remote=upstream --push
            echo -e "\e[32m✓ \e[0m Repo created, exiting."
            exit 0
        else
            echo -e "\e[31m \e[0m That name already exists in the current folder, exiting."
            exit 0
        fi
    fi
elif [[ $CHOICE1 == "Create Inside New Directory" ]]; then
    echo -e "\nWould you like this new directory to be in the home folder or current directory?"
    select CHOICE2 in "Home Folder" "Current Directory" "Exit"; do
       if [[ $CHOICE2 == "Exit" ]]; then
           exit 0
       fi
        break
    done
    read -rep $'Name your new directory:\n' DIRECTORY
    if [[ $CHOICE2 == "Home Folder" ]]; then
        if [[ ! -f "$HOME/$DIRECTORY" ]] && [[ ! -d "$HOME/$DIRECTORY" ]]; then
            echo -e "\e[32m✓ \e[0m Making new folder called $HOME/$DIRECTORY"
            mkdir -p "$HOME/$DIRECTORY"
            echo -e "\e[32m✓ \e[0m Creating new repo called $HOME/$DIRECTORY/$1"
            mkdir -p "$HOME/$DIRECTORY/$1"
            cd "$HOME/$DIRECTORY/$1"
            git init
            touch README.md
            echo "Repository Initialized" >> README.md
            git add .
            git commit -m "Batman"
            gh repo create "$1" --public --source=. --remote=upstream --push
            echo -e "\e[32m✓ \e[0m Repo created, exiting."
            exit 0
        else
            echo -e "\e[31m \e[0m That name already exists in the home folder, exiting."
            exit 0
        fi
    fi
    if [[ $CHOICE2 == "Current Directory" ]]; then
        if [[ ! -f "$CURRENT_DIRECTORY/$DIRECTORY" ]] && [[ ! -d "$CURRENT_DIRECTORY/$DIRECTORY" ]]; then
            echo -e "\e[32m✓ \e[0m Making new folder called $CURRENT_DIRECTORY/$DIRECTORY"
            mkdir -p "$CURRENT_DIRECTORY/$DIRECTORY"
            echo -e "\e[32m✓ \e[0m Creating new repo called $CURRENT_DIRECTORY/$DIRECTORY/$1"
            mkdir -p "$CURRENT_DIRECTORY/$DIRECTORY/$1"
            cd "$CURRENT_DIRECTORY/$DIRECTORY/$1"
            git init
            touch README.md
            echo "Repository Initialized" >> README.md
            git add .
            git commit -m "Batman"
            gh repo create "$1" --public --source=. --remote=upstream --push
            echo -e "\e[32m✓ \e[0m Repo created, exiting."
            exit 0
        else
            echo -e "\e[31m \e[0m That name already exists in the current folder, exiting."
            exit 0
        fi
    fi
fi
