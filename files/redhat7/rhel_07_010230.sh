#!/bin/bash

# Script sets maximum password lifetime to 60 days for incorrectly
# configured users

# Script parses results of /etc/shadow, and /etc/passwd. It then filters the accounts
# if they are able to log in with a shell.


INCORRECT_ACCOUNTS=$(awk -F: '$5 > 60 {print $1}' /etc/shadow | xargs  -I {}  grep ^{}: /etc/passwd | cut -d ':' -f 1)
SHELLS=$(grep -v nologin$ /etc/shells)


for user in ${INCORRECT_ACCOUNTS[@]}; do
	for shell in ${SHELLS[@]}; do
		if [[ $(grep "^$user:" /etc/passwd) =~ "${shell}"$ ]]; then
			INCORRECT_USERS=("${INCORRECT_USERS[@]}" "${user}" )
		fi
	done
done
			
for user in ${INCORRECT_USERS[@]}; do
	chage -M 60 "${user}"
done
