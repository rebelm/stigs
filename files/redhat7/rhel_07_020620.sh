#!/bin/bash

# This STIG will ensure the hoem profile has been created for an existing uesr

INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	if [[ ! -d $(echo $user | cut -d ':' -f 2) ]];then
		username=$(echo $user | cut -d ':' -f 1)
		userdir="/home/${username}"

		# Perform actions to create user profile
		mkdir -p "${userdir}"
		cp -a /etc/skel/. "/home/${username}"
		chown -R "${username}":"${username}" "${userdir}"
		chmod -R 0700 "${userdir}"

	fi
done
