#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
Blink='\e[5m'
yell='\e[33m'
lgreen='\e[92m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
#EDIT SETUP IZIN
clear
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
clear
echo ""  
echo -e "$green                                                             $NC"
echo -e "$yell $Blink              (        )  (                                    $NC"
echo -e "$yell $Blink              )\ )  ( /(  )\ )    )                            $NC"
echo -e "$yell $Blink      (   (  (()/(  )\())(()/( ( /(                (    (      $NC"
echo -e "$yell $Blink      )\  )\  /(_))((_)\  /(_)))\())  (      )    ))\  ))\     $NC"
echo -e "$yell $Blink     ((_)((_)(_))   _((_)(_)) ((_)\   )\  /(/(   /((_)/((_)    $NC"
echo -e "$yell $Blink                Premium Server Script          $NC"
echo -e "$yell $Blink     '-------------------------------------------------------' $NC"
echo "" 
echo -e "$green   ...........................................................$NC"
echo ''
echo -e "$green                   Telegram:$NC $red@sanpiiiiu               $NC"
echo -e "$green                 Scrript Version:$NC $red 1.0                $NC"
echo ''
echo ''
echo ''
echo ''
echo ''
echo -e "$green                  Proses akan mula dalam 5 Saat!              $NC"
echo -e "$green   ...........................................................$NC"
sleep 5
clear
echo -e "$green   =============================================$NC"
echo -e "$green    Sila Masukkan DOMAIN, Jika TIADA KLIK Enter $NC"
echo -e "$green   =============================================$NC"
mkdir /etc/v2ray
mkdir /var/lib/premium-script;
read -p " Hostname / Domain: " host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" >> /root/domain
echo "$host" >> /etc/v2ray/domain
echo "V1.0" >> /home/version
echo "@sampiiiiu" >> /home/contact
clear
echo -e "$green   =============================================$NC"
echo -e "$green               Sila Tunggu sebentar             $NC"
echo -e "$green    Process Update & Upgrade Sedang Dijalankan  $NC"
echo -e "$green   =============================================$NC"
sleep 2
apt-get update && apt-get upgrade -y && update-grub -y
clear
echo -e "$green   =============================================$NC"
echo -e "$green          Process Update&Upgrade Selesai        $NC"
echo -e "$green   =============================================$NC"
sleep 2
clear
echo -e "$green   =============================================$NC"
echo -e "$green         Installing AutoScript VPNshopee        $NC"
echo -e "$green   =============================================$NC"
sleep 2
#install ssh ovpn
echo -e "$green   =============================================$NC"
echo -e "$green                 Install SSH OVPN               $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
#install ssr
echo -e "$green   =============================================$NC"
echo -e "$green                     Install SSR                $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://istriku.me/gabut/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#install wireguard
echo -e "$green   =============================================$NC"
echo -e "$green                 Install Wireguard              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
echo -e "$green   =============================================$NC"
echo -e "$green                 Install V2RAY & TROJAN           $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#Instal Xray
echo -e "$green   =============================================$NC"
echo -e "$green                      Install XRAY              $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/xray-go.sh && chmod +x xray-go.sh && screen -S xray-go ./xray-go.sh
#set backup
echo -e "$green   =============================================$NC"
echo -e "$green                      SET BACKUP                $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# install OHP
echo -e "$green   =============================================$NC"
echo -e "$green                 Install OHP                   $NC"
echo -e "$green   =============================================$NC"
sleep 2
wget https://istriku.me/gabut/ohp.sh && chmod +x ohp.sh && screen -S ohp ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/wg.sh
rm -f /root/ins-vt.sh
rm -f /root/set-br.sh
rm -f /root/xray-go.sh
rm -f /root/ohp.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://vpnshopee.xyz

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://istriku.me/gabut/set.sh"
chmod +x /etc/set.sh
history -c
clear
echo " "
echo -e "$green   =============================================$NC"
echo -e "$green         Installation has been completed!!      $NC"
echo -e "$green   =============================================$NC"
sleep 2
echo " "
echo "=====================================-{ Autoscript Premium }-===============================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200"  | tee -a log-install.txt
echo "   - Stunnel4                : 888, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - Xray Vmess TLS          : 9443"  | tee -a log-install.txt
echo "   - Xray Vmess None TLS     : 90"  | tee -a log-install.txt
echo "   - Xray Vless TLS          : 543"  | tee -a log-install.txt
echo "   - Xray Vless None TLS     : 643"  | tee -a log-install.txt
echo "   - Xray Vless Tcp XTLS     : 443"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan-GFW              : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                 : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "   - Fail2Ban                 : [ON]"  | tee -a log-install.txt
echo "   - Dflate                   : [ON]"  | tee -a log-install.txt
echo "   - IPtables                 : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot              : [ON]"  | tee -a log-install.txt
echo "   - IPv6                     : [OFF]"  | tee -a log-install.txt
echo "   - Auto-Reboot              : [ON]" | tee -a log-install.txt
echo "   - Auto-Remove-Expired      : [ON]" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "-----------------------------Script by RARE-------------------------------------" | tee -a log-install.txt
echo ""
sleep 3
echo -e "$green   =============================================$NC"
echo -e "$green          SISTEM AKAN REBOOT SEBENTAR LAG       $NC"
echo -e "$green   =============================================$NC"
echo ""
rm -f /root/setup.sh
rm -f /root/.bash_history
echo " Reboot in 15 Sec, Setelah ON type menu"
sleep 15
reboot
