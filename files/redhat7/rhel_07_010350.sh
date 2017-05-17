#!/bin/bash

# Remove NOPASSWD from /etc/sudoers
sed -i -e '/^[^#].*\!authenticate.*/d' /etc/sudoers

# Remove NOPASSWD lines in sudoers.d directory
for file in $(find /etc/sudoers.d/ -type f); do
	sed -i -e '/^[^#].*\!authenticate.*/d' "${file}"
done


