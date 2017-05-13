#!/bin/bash

# Script sets minimum password lifetime to 24hours/1day for incorrectly
# configured users

INCORRECT_USERS=$(awk -F: '$4 <1 {print $1}' /etc/shadow | grep -f -  /etc/passwd | grep -v /sbin/nologin | cut -d ':' -f 1)

for user in ${INCORRECT_USERS[@]}; do
	chage -m 1 "${user}"
done
