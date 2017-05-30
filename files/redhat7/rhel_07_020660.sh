#!/bin/bash

# This stig ensures that each fine in a users home profile
# is owned by the user
# This is the same solution as RHEL-07-020640, but the chown command is recursive

INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	username=$(echo $user | cut -d ':' -f 1)
	userdir="/home/${username}"

	chown -R "${username}" "${userdir}"

done
