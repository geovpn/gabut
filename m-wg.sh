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
echo -e  "$PURPLE    |                     $Blink $yell WIREGUARD MENU$NC                  $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create Wireguard Account$NC"
echo -e "   $green  2)$NC $yell Delete Wireguard Account$NC"
echo -e "   $green  3)$NC $yell Check User Login Wireguard$NC"
echo -e "   $green  4)$NC $yell Renew Wireguard Account$NC"
echo -e "   $green  5)$NC $red BACK TO MENU$NC"
echo -e ""
read -p "     Please Input Number  [1-5 or x] :  "  opt
echo -e ""
case $opt in
1) clear ; add-wg ; exit ;;
2) clear ; del-wg ; exit ;;
3) clear ; cek-wg ; exit ;;
4) clear ; renew-wg ; exit ;;
5) clear ; menu ; exit ;;
x) exit ; exit ;;
* )echo  "Please enter an correct number";;
esac
