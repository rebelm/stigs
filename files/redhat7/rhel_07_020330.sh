#!/bin/bash

# This assigns root to the group of any files without a group
for file in $(find / -xdev -nogroup); do
	chgrp root "${file}"
done
