#!/bin/bash

# This stig ensures that all files and directories in home profiles have 0750 permissions or less

INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	name=$(echo $user | cut -d ':' -f 1)
	homedir=$(echo $user | cut -d ':' -f 2)

	chown "${name}" "${homedir}"/.* 
done
