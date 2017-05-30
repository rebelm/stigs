#!/bin/bash

# WARNING: The following code performs ugly text parsing.
# Try to understand at your own risk


# We want this function to always run, as it will always be beneficial
# for the grub command line to find the boot partitoin
function Configure_Boot_Partition {

	BOOT_PARTITION=$(df /boot | grep boot | awk '{print $1}')
	UUID=$(blkid $BOOT_PARTITION | awk '{print $3}' | cut -d '"' -f2)

	# Check if boot UUID has already been set
	if ! grep 'GRUB_CMDLINE_LINUX' /etc/default/grub | grep "boot=UUID=$UUID" > /dev/null 2>&1; then
		GRUB_BOOT=$(awk '
			{if ($0 ~ "^GRUB_CMDLINE_LINUX=") 
				{print substr($0, 1, length($0)-1);}}' /etc/default/grub | 
			awk -v BOOT_UUID="${UUID}" '{ print $0" boot=UUID="BOOT_UUID"\""}')

			sed -i -e "s|GRUB_CMDLINE_LINUX.*|$GRUB_BOOT|" /etc/default/grub
	fi
}


# Check if dracut-fips is installed or not. This will determine if
# grub should be set to fips=1 or have the subcommand removed
function Check_Dracut {
	INSTALLED=$(rpm -q dracut-fips > /dev/null 2>&1; echo $?)
}

function Set_Grub {
	if [[ "${INSTALLED}" -eq '0' ]]; then
		# Dracut-fips is installed
		# Awk parsing to get grub command line with fips=1 appended
		FIPS_ON=$(awk '{if ($0 ~ "^GRUB_CMDLINE_LINUX=") {print substr($0, 1, length($0)-1);}}' /etc/default/grub | awk '{ print $0" fips=1\""}')

		sed -i -e "s|GRUB_CMDLINE_LINUX.*|$FIPS_ON|" /etc/default/grub
	else
		# dracut-fips is not installed, ensure fips=1 is not in the grub defaults
		sed -i -r -e 's/ ?fips=1//g' /etc/default/grub
	fi
}

function Build_Grub {

	if [[ -d /sys/firmware/efi ]]; then
		grub2-mkconfig -o /boot/efi/EFI/redhat/grub.cfg
	else
		grub2-mkconfig -o /boot/grub2/grub.cfg
	fi

}


Configure_Boot_Partition
Check_Dracut
Set_Grub
Build_Grub
