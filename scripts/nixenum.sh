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
SVCMGR=$(ps -p 1 | grep -o '[a-z]*$')

printf "[+] Architecture:\t %s\n" "$ARCH"
printf "[+] CPU:\t\t %s\n" "$CPU"
printf "[+] Firmware:\t\t %s\n" "$FIRMWARE"
printf "[+] OS:\t\t\t %s\n" "$OS"
printf "[+] Kernel:\t\t %s\n" "$KERNEL"
printf "[+] Service Manager:\t %s\n" "$SVCMGR"
printf "[+] Shell:\t\t %s\n" "$SHELL"
