#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
clear
echo -e ""
echo -e ""
echo -e ""
echo -e "======================================"
echo -e "       Change Port All Service"
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Stunnel4"
echo -e "     [2]  Change Port OpenVPN"
echo -e "     [3]  Change Port Wireguard"
echo -e "     [4]  Change Port V2RAY Vmess"
echo -e "     [5]  Change Port V2RAY Vless"
echo -e "     [6]  Change Port XRAY Vmess"
echo -e "     [7]  Change Port XRAY Vless"
echo -e "     [8]  Change Port XRAY XTLS"
echo -e "     [9]  Change Port Trojan"
echo -e "     [10]  Change Port Squid"
echo -e "     [11]  BACK TO MENU"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-11 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; port-ssl ; exit ;;
2) clear ; port-ovpn ; exit ;;
3) clear ; port-wg ; exit ;;
4) clear ;port-ws ; exit ;;
5) clear ; port-vless ; exit ;;
6) clear ;port-xws ; exit ;;
7) clear ; port-xvless ; exit ;;
8) clear ; port-xtls ; exit ;;
9) clear ; port-tr ; exit ;;
10) clear ; port-squid ; exit ;;
11) clear ; menu ; exit ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac
