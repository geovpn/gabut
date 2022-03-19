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
echo -e  "$PURPLE    |                      $Blink $yell V2RAY VMESS MENU$NC               $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create Vmess Websocket Account $NC"
echo -e "   $green  2)$NC $yell Delete Vmess Websocket Account $NC"
echo -e "   $green  3)$NC $yell Renew Vmess Account $NC"
echo -e "   $green  4)$NC $yell Check User Login Vmess $NC"
echo -e "   $green  5)$NC $red BACK TO MENU $NC"
echo -e ""
read -p "     Select From Options [1-5 or x] :  " v2ray
echo -e   ""
case $v2ray in
1) clear ; add-ws ;;
2) clear ; del-ws ;;
3) clear ; renew-ws ;;
4) clear ; cek-ws ;;
5) clear ; menu ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac