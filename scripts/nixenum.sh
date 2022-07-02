#!/bin/sh

ARCH=$(uname -m)

CPU=$(lscpu | grep -o 'Model name:[^$]*' | cut -d':' -f2 | \
	sed 's/[ \t]*//')

FIRMWARE="BIOS"
if [ -d /sys/firmware/efi ]
then
	FIRMWARE="UEFI"
fi

OS=$(uname -o)

KERNEL=$(uname -r)

# Last field of ps with pid 1
# shellcheck reports SC2009, but I doubt pgrep is a portable alternative
# Could alternatively use `readlink -f /sbin/init` which is a symlink
#	to systemd on a systemd system
SVCMGR=$(ps -p 1 | grep -o '[a-z]*$')

# /etc/timezone on Debian, /etc/localtime (not ASCII) on RedHat
# TODO: fix this to support other distros
TIMEZONE=$(cat /etc/timezone)
# date +"%:z" might be more portable, but it's a number

printf "[+] Architecture:\t %s\n" "$ARCH"
printf "[+] CPU:\t\t %s\n" "$CPU"
printf "[+] Firmware:\t\t %s\n" "$FIRMWARE"
printf "[+] OS:\t\t\t %s\n" "$OS"
printf "[+] Kernel:\t\t %s\n" "$KERNEL"
printf "[+] Service Manager:\t %s\n" "$SVCMGR"
printf "[+] Shell:\t\t %s\n" "$SHELL"
printf "[+] Language:\t\t %s\n" "$LANG"
printf "[+] Timezone:\t\t %s\n" "$TIMEZONE"
