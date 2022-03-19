#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
xtls="$(cat ~/log-install.txt | grep -w "Xray Vless Tcp XTLS" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "     Change Port Xray TCP XTLS $xtls"
echo -e ""
echo -e "======================================"
echo -e ""
echo -e ""
read -p "New Port Xray TCP XTLS: " xtls1
if [ -z $xtls1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $xtls1)
if [[ -z $cek ]]; then
sed -i "s/$xtls/$xtls1/g" /usr/local/etc/xray/tcp_xtls.json
sed -i "s/   - Xray Vless Tcp XTLS     : $xtls/   - Xray Vless Tcp XTLS     : $xtls1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $xtls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $xtls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $xtls1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $xtls1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray@tcp_xtls > /dev/null
echo -e "\e[032;1mPort $xtls1 modified successfully\e[0m"
else
echo "Port $xtls1 is used"
fi