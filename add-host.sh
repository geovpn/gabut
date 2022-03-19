#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
#EDIT IZIN
clear 
echo -e  "   .-------------------------------------------------------."
echo -e  "   |                 ADD HOST/DOMAIN MENU                  |"
echo -e  "   '-------------------------------------------------------'"
echo ""
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf

#Update Sertificate SSL
echo "Automatical Update Your Sertificate SSL"
sleep 3
echo Starting Update SSL Sertificate
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$IP
systemctl stop xray
systemctl stop xray.service
systemctl stop trojan
systemctl stop trojan.service
systemctl stop v2ray
systemctl stop v2ray@none
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key --ecc
systemctl daemon-reload
systemctl restart trojan
systemctl restart trojan.service
systemctl restart v2ray
systemctl restart v2ray@none
systemctl restart xray
systemctl restart xray.service

#Done
echo -e "[${GREEN}Done${NC}]"
echo "Location Your Domain : /var/lib/premium-script/ipvps.conf"
echo ""