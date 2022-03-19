#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/tcp_xtls.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "       Delete XRAY XTLS  Account"		
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "       Delete XRAY XTLS Account"			
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo ""
	echo " ==============================="	
	echo "     No  Expired   User"
	grep -E "^### " "/usr/local/etc/xray/tcp_xtls.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
user=$(grep -E "^### " "/usr/local/etc/xray/tcp_xtls.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/tcp_xtls.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $user $exp/,/^},{/d" /usr/local/etc/xray/tcp_xtls.json
systemctl restart xray@tcp_xtls
clear
echo " XRAY XTLS Account Deleted Successfully"
echo " =========================="	
echo " Client Name : $user"
echo " Expired On  : $exp"
echo " =========================="	
