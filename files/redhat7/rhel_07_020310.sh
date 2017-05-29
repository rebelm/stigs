#!/bin/bash
# in progress

# Luke i have determined system users, i still need to find out
if it has a UID of 0. if it is 0 i need to set it to the next available UID
SYSTEM_USERS=$(awk 'BEGIN {
	FS = ":"
}
{
	if ( $3 <= 1000 ) { print $1":"$6 }
}' /etc/passwd)


for user in ${INTERACTIVE_USERS[@]};do
	if [[ $(echo $user | cut -d ':' -f 2) == "" ]];then
		 echo $user | awk 'BEGIN { FS = ":" } $6 = "/home/"$1' 
	#	echo "user $(echo $user | cut -d ':' -f 1) has no home directory"
	fi
done


# determines next available uid in range i set
awk -F: '{uid[$3]=1}END{for(x=2000; x<=3000; x++) {if(uid[x] != ""){}else{print x; exit;}}}' /etc/passwd

