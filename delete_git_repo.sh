#!/usr/bin/env bash

# NOTICE: This program uses the command `rm -rf`. Please, Please, Please be
# careful what you run.

# This is a script that takes a git repo, deletes the repo on github,
# and then also deletes the repo on the local computer.

# What I use it for: I have it aliased in my zshrc as 'delete' for deleting
# a github repository.

# Tools used: gh, sleep, echo, curl, jq, rm, sed

echo -e "\nAre you sure you want to delete the remote git repo and the associated local directory?"
select CHOICE1 in "Yes" "No" "Exit"; do
    if [[ $CHOICE1 == "Exit" ]]; then
        echo -e "\e[31m \e[0m Script quit, exiting."
        exit 0
    fi
    break
done

if [[ $CHOICE1 == "Yes" ]]; then
    CURRENT_DIRECTORY=$(pwd)
    DIRECTORY_TO_DELETE="$CURRENT_DIRECTORY/$1"

    cd $DIRECTORY_TO_DELETE

    GIT_URL1=$(git config remote.origin.url)
    GIT_URL2=$(git config remote.upstream.url)

    cd $CURRENT_DIRECTORY

    if [[ $GIT_URL1 ]]; then
        GIT_URL="$GIT_URL1"
        MODIFICATIONS=${GIT_URL1##*:}
        GIT_REPO=$(echo $MODIFICATIONS | sed 's/.git$//')
    elif [[ $GIT_URL2 ]]; then
        GIT_URL="$GIT_URL2"
        MODIFICATIONS=${GIT_URL2##*:}
        GIT_REPO=$(echo $MODIFICATIONS | sed 's/.git$//')
    fi

    if [[ $GIT_URL == *"github"* ]]; then
        echo -e "\n"
        echo -e "\e[32m✓ \e[0m Please confirm remote repo name: $GIT_REPO"
        select CHOICE2 in "Yes" "No" "Exit"; do
            if [[ $CHOICE2 == "Exit" ]]; then
                echo -e "\e[31m \e[0m Script stopped prior to delete, exiting."
                exit 0
            fi
            break
        done
        if [[ $CHOICE2 == "Yes" ]]; then
            if [[ $(curl -s "https://api.github.com/repos/$GIT_REPO" | jq -r ".message") != "Not Found" ]]; then
                echo -e "\e[32m✓ \e[0m Removing remote repository."
                gh repo delete "$GIT_REPO" --yes
            else
                echo -e "\e[32m✓ \e[0m Remote repository already deleted."
            fi
        else
            echo -e "\e[31m \e[0m Script stopped prior to delete, exiting."
            exit 0
        fi
        echo -e "\e[32m✓ \e[0m Checking if local repo can safely be removed."
        sleep 2
        if [[ $(curl -s "https://api.github.com/repos/$GIT_REPO" | jq -r ".message") == "Not Found" ]]; then
            echo -e "\e[32m✓ \e[0m Please confirm local directory: $DIRECTORY_TO_DELETE"
            select CHOICE3 in "Yes" "No" "Exit"; do
                if [[ $CHOICE3 == "Exit" ]]; then
                    echo -e "\e[31m \e[0m Script stopped prior to delete, exiting."
                    exit 0
                fi
                break
            done
            if [[ $CHOICE3 == "Yes" ]]; then
                echo -e "\e[32m✓ \e[0m Removing local directory."
                /bin/rm -rf "$DIRECTORY_TO_DELETE"
            else
                echo -e "\e[31m \e[0m Script stopped prior to delete, exiting."
                exit 0
            fi
            if [[ ! -d "$DIRECTORY_TO_DELETE" ]]; then
                echo -e "\e[32m✓ \e[0m Local directory removed, script finished."
                exit 0
            else
                echo -e "\e[31m \e[0m Deletion failed, exiting."
                exit 0
            fi
        else
            echo -e "\e[31m \e[0m Remote repo on github still exists and the associated directory should not be removed locally."
            echo -e "\e[31m \e[0m Please delete remote repo first."
            exit 0
        fi
    elif [[ $GIT_URL ]]; then
        echo -e "\e[31m \e[0m This script only supports deletion of github repos, exiting."
        exit 0
    else
        echo -e "\e[31m \e[0m This is not a github or bitbucket git repo, exiting."
        exit 0
    fi
fi
