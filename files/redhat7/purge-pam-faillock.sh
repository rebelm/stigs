#!/bin/bash

PAM_CONFIGS=(
/etc/pam.d/system-auth-ac
/etc/pam.d/password-auth-ac
)

REGEXES=(
'^auth.*required.*pam_faillock'
'^auth.*pam_unix'
'^auth.*default=die.*pam_faillock'
)

for PAM_CONFIG in ${PAM_CONFIGS[@]}; do

	for REGEX in ${REGEXES[@]}; do
		sed -i "/${REGEX}/d" "${PAM_CONFIG}"
	done
done
