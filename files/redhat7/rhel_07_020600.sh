#!/bin/bash
# in progress
INTERACTIVE_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 >= 1000 && $7 !~ "nologin" ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	if [[ $(echo $user | cut -d ':' -f 2) == "" ]];then
		 echo $user | awk 'BEGIN { FS = ":" } $6 = "/home/"$1' 
	#	echo "user $(echo $user | cut -d ':' -f 1) has no home directory"
	fi
done
