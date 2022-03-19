#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"

clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/trojan/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo -e " $green Renew Trojan Account$NC"
		echo ""
		echo -e "$red You have no existing clients!$NC"
		exit 1
	fi

	clear
	echo ""
	echo -e "$green Renew Trojan Account"
	echo ""
	echo -e "Select the existing client you want to renew$NC"
	echo -e "$red Press CTRL+C to return$NC"
	echo ""
	echo -e "$green===============================$NC"
	grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "Expired (days): " masaaktif
user=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/trojan/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/trojan/akun.conf
clear
echo ""
echo -e "$green Trojan Account Was Successfully Renewed"
echo " =========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " ==========================$NC"
