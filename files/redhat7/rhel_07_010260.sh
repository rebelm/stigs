#!/bin/bash
# Removes any reference of the phrase 'nullok' from pam system-auth

sed -i -e 's/nullok//g' /etc/pam.d/system-auth


