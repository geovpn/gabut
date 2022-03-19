#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green                    $Blink UPDATE SCRIPT$NC               $NC"
echo -e "$green   =============================================$NC"
sleep 5
wget https://istriku.me/gabut/update.sh && chmod +x update.sh && screen -S update ./update.sh
rm -f /root/update.sh
