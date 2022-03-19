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
echo -e  "$PURPLE    |                     $Blink $yell SYSTEM MENU$NC                     $PURPLE|"
echo -e  "$PURPLE    '-------------------------------------------------------'$NC"
echo -e "   $green   1)$NC $yell Panel Domain$NC"
echo -e "   $green   2)$NC $yell Change Port All Account$NC"
echo -e "   $green   3)$NC $yell Autobackup Data VPS$NC"
echo -e "   $green   4)$NC $yell Backup Data VPS$NC"
echo -e "   $green   5)$NC $yell Restore Data VPS$NC"
echo -e "   $green   6)$NC $yell Webmin Menu$NC"
echo -e "   $green   7)$NC $yell Limit Bandwith Speed Server$NC"
echo -e "   $green   8)$NC $yell Check Running System Status Tunneling$NC"
echo -e "   $green   9)$NC $yell Check Usage of VPS Ram$NC"
echo -e "   $green  10)$NC $red Reboot VPS$NC"
echo -e "   $green  11)$NC $yell Speedtest VPS$NC"
echo -e "   $green  12)$NC $yell Information Display System$NC"
echo -e "   $green  13)$NC $yell About Script Auto Install$NC"
echo -e "   $green  14)$NC $yell Install BBR$NC"
echo -e "   $green  15)$NC $yell Set Auto Reboot$NC"
echo -e "   $green  16)$NC $yell User Limit$NC"
echo -e "   $green  17)$NC $yell Clear Log$NC"
echo -e "   $green  18)$NC $yell Restart All Service$NC"
echo -e "   $green  19)$NC $yell Change Banner$NC"
echo -e "   $green  20)$NC $yell Cek Bandwith$NC"
echo -e "   $green  21)$NC $yell Reset Server$NC"
echo -e "   $green  22)$NC $yell Update To Last Version$NC"
echo -e "   $green  23)$NC $yell Kernel Update$NC"
echo -e "   $green  24)$NC $red BACK TO MENU$NC"
echo -e   ""
read -p "     Select From Options [1-24 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; domain-menu ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; autobackup ; exit ;; #set.br
4) clear ; backup ; exit ;; #set.br
5) clear ; restore ; exit ;; #set.br
6) clear ; webmin ; exit ;;
7) clear ; limit-speed ; exit ;; #set.br
8) clear ; running ; exit ;;
9) clear ; ram ; exit ;;
10) clear ; reboot ; exit ;;
11) clear ; speedtest ; exit ;;
12) clear ; info ; exit ;;
13) clear ; about ; exit ;;
14) clear ; bbr ; exit ;;
15) clear ; auto-reboot ; exit ;;
16) clear ; user-limit ; exit ;;
17) clear ; clear-log ; exit ;;
18) clear ; restart ; exit ;;
19) clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
20) clear ; bw ; exit ;;
21) clear ; resett ; exit ;;
22) clear ; update ; exit ;;
23) clear ; kernel-updt ; exit ;;
24) clear ; menu ; exit ;;
x) exit ;;
*) echo "Please enter an correct number" ;;
esac
