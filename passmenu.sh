#!/usr/bin/env bash
#
# This is a script that fetches my passwords from 'pass - the
# standard unix password manager'. It prompts for a master password
# based on your output of $(whoami), lets you choose a password
# to copy, and then prompts for your user gpg password. Assuming
# successful gpg password, it will copy the password to your
# clipboard for 45 seconds.
#
# Tools used: rofi and pass(which has its own dependencies).

password=$(rofi -dmenu -p "Enter Password: " -password)

if [ $(/usr/bin/whoami) = $password ]; then

    shopt -s nullglob globstar

    typeit=0
    if [[ $1 == "--type" ]]; then
	    typeit=1
	    shift
    fi

    prefix=${PASSWORD_STORE_DIR-~/.password-store}
    password_files=( "$prefix"/**/*.gpg )
    password_files=( "${password_files[@]#"$prefix"/}" )
    password_files=( "${password_files[@]%.gpg}" )

    password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu -i -p "Choose Password: " "$@")

    [[ -n $password ]] || exit

    if [[ $typeit -eq 0 ]]; then
	pass show -c "$password" 2>/dev/null
    else
	    pass show "$password" | { IFS= read -r pass; printf %s "$pass"; } |
		    xdotool type --clearmodifiers --file -
    fi
fi

notify-send "Clipped $password password"
