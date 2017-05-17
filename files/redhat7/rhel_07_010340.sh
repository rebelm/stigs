#!/bin/bash

# Remove NOPASSWD from /etc/sudoers
sed -i -e '/^[^#].*NOPASSWD.*/d' /etc/sudoers

# Remove NOPASSWD lines in sudoers.d directory
for file in $(find /etc/sudoers.d/ -type f); do
	sed -i -e '/^[^#].*NOPASSWD.*/d' "${file}"
done


