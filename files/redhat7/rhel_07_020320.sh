#!/bin/bash

# This assigns root to the owner of any files without a user
for file in $(find / -xdev -nouser); do
	chown root "${file}"
done
