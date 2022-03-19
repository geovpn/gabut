#!/bin/bash
# Color Validation
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
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
# VPS Information
Checkstart1=$(ip route | grep default | cut -d ' ' -f 3 | head -n 1);
if [[ $Checkstart1 == "venet0" ]]; then 
    clear
	  lan_net="venet0"
    typevps="OpenVZ"
    sleep 1
else
    clear
		lan_net="eth0"
    typevps="KVM"
    sleep 1
fi
#EDIT IZIN
clear
# DNS Patch
tipeos2=$(uname -m)
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
# Download
download=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev  | awk '{print $2}' | paste -sd+ - | bc`
downloadsize=$(($download/1073741824))
# Upload
upload=`grep -e "lo:" -e "wlan0:" -e "eth0" /proc/net/dev | awk '{print $10}' | paste -sd+ - | bc`
uploadsize=$(($upload/1073741824))
# Getting CPU Information
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
# Shell Version
shellversion=""
shellversion=Bash
shellversion+=" Version" 
shellversion+=" ${BASH_VERSION/-*}" 
versibash=$shellversion
# Getting OS Information
source /etc/os-release
Versi_OS=$VERSION
ver=$VERSION_ID
Tipe=$NAME
URL_SUPPORT=$HOME_URL
basedong=$ID
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
domain=$(cat /etc/v2ray/domain)
Sver=$(cat /home/version)
tele=$(cat /home/contact)
DAY=$(date +%A)
DATE=$(date +%m/%d/%Y)
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	uram=$( free -m | awk 'NR==2 {print $3}' )
	fram=$( free -m | awk 'NR==2 {print $4}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
echo ""  
echo -e "$green                                                            $NC"
echo -e "                $green $Bold System Information $NC"
	echo -e "   $green VPS Type             :$NC  $typevps"
	echo -e "   $green CPU Model            :$NC $cname"
	echo -e "   $green CPU Frequency        :$NC $freq MHz"
	echo -e "   $green Number Of Cores      :$NC  $cores"
	echo -e "   $green CPU Usage            :$NC  $cpu_usage"
	echo -e "   $green Operating System     :$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
	echo -e "   $green OS Family            :$NC  `uname -s`"	
	echo -e "   $green Kernel               :$NC  `uname -r`"
	echo -e "   $green Bash Ver             :$NC  $versibash"
	echo -e "   $green Total Amount Of RAM  :$NC  $tram MB"
	echo -e "   $green Used RAM             :$NC  $uram MB"
	echo -e "   $green Free RAM             :$NC  $fram MB"
	echo -e "   $green System Uptime        :$NC  $uptime $DF( From VPS Booting )"
	echo -e "   $green Download             :$NC  $downloadsize GB ( From Startup / VPS Booting )"
	echo -e "   $green Upload               :$NC  $uploadsize GB ( From Startup / VPS Booting )"
	echo -e "   $green Isp Name             :$NC  $ISP"
	echo -e "   $green Domain               :$NC  $domain"	
        echo -e "   $green Ip Vps               :$NC  $IPVPS"	
	echo -e "   $green City                 :$NC  $CITY"
	echo -e "   $green Time                 :$NC  $WKT"
	echo -e "   $green Day                  :$NC  $DAY"
	echo -e "   $green Date                 :$NC  $DATE"
	echo -e "   $green Telegram             :$NC  $tele"
	echo -e "   $green Script Version       :$NC  $Sver"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                    $Blink $yell Dashboard Menu$NC                   $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e "   $green 1)$NC $yell SSH & OpenVPN Menu        $green  7)$NC $yell XRAY VLESS Menu"
echo -e "   $green 2)$NC $yell Wireguard Menu            $green  8)$NC $yell XRAY TCP XTLS Menu"
echo -e "   $green 3)$NC $yell SSR & SS Menu             $green  9)$NC $yell Trojan GFW Menu"
echo -e "   $green 4)$NC $yell V2RAY VMESS Menu          $green 10)$NC $yell SYSTEM Menu"
echo -e "   $green 5)$NC $yell V2RAY VLESS Menu          $green 11)$NC $yell Script Install Log"
echo -e "   $green 6)$NC $yell XRAY VMESS Menu           $green 12)$NC $red REBOOT"
echo -e  "$PURPLE  .-------------------------------------------------------."
echo -e  "$PURPLE  |                $yell Script status : Premium$NC               $PURPLE|"
echo -e  "$PURPLE  '-------------------------------------------------------'$NC"
echo -e   ""
read -p "     Select From Options [1-12 or x] :  " opt
echo -e   ""
case $opt in
1) clear ; m-sshovpn ;;
2) clear ; m-wg ;;
3) clear ; m-ssr ;;
4) clear ; v2ray-vmess ;;
5) clear ; v2ray-vless ;;
6) clear ; xray-vmess ;;
7) clear ; xray-vless ;;
8) clear ; xray-xtls ;;
9) clear ; m-trojan ;;
10) clear ; m-system ;;
11) clear ; info ;;
12) clear ; reboot ;;
x) exit ;;
* )echo  "Please enter an correct number";;
esac
