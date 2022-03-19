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
echo -e  "$PURPLE    |                      $Blink $yell V2RAY VLESS MENU$NC               $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green  1)$NC $yell Create V2RAY Vless Websocket Account $NC"
echo -e "   $green  2)$NC $yell Deleting V2RAY Vless Websocket Account $NC"
echo -e "   $green  3)$NC $yell Renew V2RAY Vless Account $NC"
echo -e "   $green  4)$NC $yell Check User Login V2RAY Vless$NC"
echo -e "   $green  5)$NC $red BACK TO MENU $NC"
echo -e ""
read -p "     Select From Options [1-5 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; add-vless ;;
2) clear ; del-vless ;;
3) clear ; renew-vless ;;
4) clear ; cek-vless ;;
5) clear ; menu ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac