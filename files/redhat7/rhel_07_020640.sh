#!/bin/bash

# This stig ensures each home profile is owned by the user

INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	username=$(echo $user | cut -d ':' -f 1)
	userdir="/home/${username}"

	chown "${username}" "${userdir}"

done
