#!/bin/bash

# This script will put all users with a UID of 0 in an array. It will
# Then assign them a new available UID number based on if they are assigned
# a shell or not

function Get_System_UID {
	 local  NEW_UID=$(awk -F: '{uid[$3]=1}END{for(x=1; x<=999; x++) {if(uid[x] != ""){}else{print x; exit;}}}' /etc/passwd)
	 echo "${NEW_UID}"
}

function Get_User_UID {
	 local NEW_UID=$(awk -F: '{uid[$3]=1}END{for(x=2000; x<=3000; x++) {if(uid[x] != ""){}else{print x; exit;}}}' /etc/passwd)
	 echo "${NEW_UID}"
}


PRIVILEGED_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 == 0 && $1 != "root" ) { print $1 }
}' /etc/passwd)


SHELLS=$(cat /etc/shells | grep -v nologin)
		

for user in ${PRIVILEGED_USERS[@]}; do
	USER_FLAG=0
	for shell in ${SHELLS[@]}; do
		if [ "$(grep "^$user" /etc/passwd | awk -F ':' '{print $7}')" == "$shell" ]; then
			USER_FLAG=1
		fi	
	done
	if [[ "$USER_FLAG" -eq "1" ]]; then
		NEXT_UID=$(Get_User_UID)
	else
		NEXT_UID=$(Get_System_UID)
	fi

	sed -i -e "/^$user/ { s|:0:|:$NEXT_UID:|}" /etc/passwd

done

