#!/bin/bash

# This stig ensures each home profile is group owned by the user's primary group

INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$4 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	username=$(echo $user | cut -d ':' -f 1)
	GID=$(echo $user | cut -d ':' -f 2)
	PRIMARY_GROUP=$(grep $GID /etc/group | cut -d ':' -f 1)
	userdir="/home/${username}"

	chgrp "${PRIMARY_GROUP}" "${userdir}"
done
