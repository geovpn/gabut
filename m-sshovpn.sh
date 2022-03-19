#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
clear
echo -e ""
echo -e ""
echo -e "" 
echo -e  "$PURPLE    .-------------------------------------------------------."
echo -e  "$PURPLE    |                    $Blink $yell SSH & OVPN Menu$NC                  $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create SSH & OpenVPN Account$NC"
echo -e "   $green  2)$NC $yell Trial Account SSH & OpenVPN$NC"
echo -e "   $green  3)$NC $yell Renew SSH & OpenVPN Account $NC"
echo -e "   $green  4)$NC $yell Delete SSH & OpenVPN Account$NC"
echo -e "   $green  5)$NC $yell Check User Login SSH & OpenVPN$NC"
echo -e "   $green  6)$NC $yell List Member SSH & OpenVPN$NC"
echo -e "   $green  7)$NC $yell Delete User Expired SSH & OpenVPN$NC"
echo -e "   $green  8)$NC $yell Set up Autokill SSH$NC"
echo -e "   $green  9)$NC $yell Cek Users Who Do Multi Login SSH$NC"
echo -e "   $green 10)$NC $red BACK TO MENU$NC"
echo -e ""
read -p "     Please Input Number  [1-10 or x] :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
10) clear ; menu ; exit ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac
