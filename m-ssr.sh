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
echo -e  "$PURPLE    |                    $Blink $yell SSR & SS MENU$NC                    $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create SSR Account$NC"
echo -e "   $green  2)$NC $yell Create Shadowsocks Account$NC"
echo -e "   $green  3)$NC $yell Deleting SSR Account$NC"
echo -e "   $green  4)$NC $yell Delete Shadowsocks Account$NC"
echo -e "   $green  5)$NC $yell Renew SSR Account Active$NC"
echo -e "   $green  6)$NC $yell Renew Shadowsocks Account$NC"
echo -e "   $green  7)$NC $yell Check User Login Shadowsocks$NC"
echo -e "   $green  8)$NC $yell Show Other SSR Menu$NC"
echo -e "   $green  9)$NC $red BACK TO MENU$NC"
echo -e ""
read -p "     Select From Options [1-9 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; add-ssr ;;
2) clear ; add-ss ;;
3) clear ; del-ssr ;;
4) clear ; del-ss ;;
5) clear ; renew-ssr ;;
6) clear ; renew-ss ;;
7) clear ; cek-ss ;;
8) clear ; ssrmu ;;
9) clear ; menu ;;
*) echo "Please enter an correct number" ;;
esac
