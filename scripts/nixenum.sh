#!/bin/sh

# Last field of ps with pid 1
SVCMGR=$(ps -p 1 | grep -o '[a-z]*$')

ARCH=$(uname -m)
CPU=$(lscpu | grep -o 'Model name:[^$]*' | cut -d':' -f2 | \
	sed 's/[ \t]*//')
OS=$(uname -o)
KERNEL=$(uname -r)

echo "[+] Architecture:\t $ARCH"
echo "[+] CPU:\t\t $CPU"
echo "[+] Firmware:\t $FIRMWARE"
echo "[+] OS:\t\t\t $OS"
echo "[+] Kernel:\t\t $KERNEL"
echo "[+] Service Manager:\t $SVCMGR"
echo "[+] Shell:\t\t $SHELL"
