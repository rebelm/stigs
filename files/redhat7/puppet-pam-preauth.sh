#!/bin/bash

# This script is essentially a hack to allow granular control
# of the PAM files with Puppet.

# Puppet has a resource type called 'file_line' that allows you to specify
# a line to exist anywhere in a file, and optionally after a regex match.
# Unfortunately you can't place a line BEFORE a match. This script will place
# comments in front of each section (auth, account, password session ). This script
# will have the 'before' metadata resource on all the PAM manifests. This will allow
# The puppet manifests to accurately predict file line placements in the PAM file.

PAM_CONFIGS=(
/etc/pam.d/system-auth
/etc/pam.d/password-auth
)
TMP_FILE="/tmp/pam-config.tmp"

for PAM_CONFIG in ${PAM_CONFIGS[@]}; do

	if ! grep 'PUPPET MANAGED FILE' "${PAM_CONFIG}" > /dev/null 2>&1; then
		sed -i -e "1i\# PUPPET MANAGED FILE\! If module 'lukepafford-stigs' is regularly applied, then changes with authconfig may not be saved\!" "${PAM_CONFIG}"
	fi
	# Insert comment before first auth section
	if ! grep "#Begin-auth" "${PAM_CONFIG}" > /dev/null 2>&1; then
		awk '/^auth/ && !x {print "#Begin-auth"; x=1} 1' "${PAM_CONFIG}" > "${TMP_FILE}" && \
		mv "${TMP_FILE}" "${PAM_CONFIG}"
	fi
	# Insert comment before first account section
	if ! grep "#Begin-account" "${PAM_CONFIG}" > /dev/null 2>&1; then
		awk '/^account/ && !x {print "#Begin-account"; x=1} 1' "${PAM_CONFIG}" > "${TMP_FILE}" && \
		mv "${TMP_FILE}" "${PAM_CONFIG}"
	fi
	# Insert comment before first password section
	if ! grep "#Begin-password" "${PAM_CONFIG}" > /dev/null 2>&1; then
		awk '/^password/ && !x {print "#Begin-password"; x=1} 1' "${PAM_CONFIG}" > "${TMP_FILE}" && \
		mv "${TMP_FILE}" "${PAM_CONFIG}"
	fi
	# Insert comment before first session section
	if ! grep "#Begin-session" "${PAM_CONFIG}" > /dev/null 2>&1; then
		awk '/^session/ && !x {print "#Begin-session"; x=1} 1' "${PAM_CONFIG}" > "${TMP_FILE}" && \
		mv "${TMP_FILE}" "${PAM_CONFIG}"
	fi

done

