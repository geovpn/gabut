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
if [ ! -e /usr/local/bin/reboot_otomatis ]; then
echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis 
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis 
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis 
echo 'echo "Server successfully rebooted on the date of $tanggal hit $waktu." >> /root/log-reboot.txt' >> /usr/local/bin/reboot_otomatis 
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis 
chmod +x /usr/local/bin/reboot_otomatis
fi
echo -e ""
echo -e ""
echo -e ""
echo -e  "$PURPLE    =============================================$NC"
echo -e  "$PURPLE       $Blink    $yell  [System Auto Reboot Menu]$NC          $PURPLE"
echo -e  "$PURPLE    =============================================$NC"
echo -e "   $green  1)$NC $yell Set Auto-Reboot Setiap 1 Jam$NC"
echo -e "   $green  2)$NC $yell Set Auto-Reboot Setiap 6 Jam$NC"
echo -e "   $green  3)$NC $yell Set Auto-Reboot Setiap 12 Jam$NC"
echo -e "   $green  4)$NC $yell Set Auto-Reboot Setiap 1 Hari$NC"
echo -e "   $green  5)$NC $yell Set Auto-Reboot Setiap 1 Minggu$NC"
echo -e "   $green  6)$NC $yell Set Auto-Reboot Setiap 1 Bulan$NC"
echo -e "   $green  7)$NC $yell Matikan Auto-Reboot$NC"
echo -e "   $green  8)$NC $yell View reboot log$NC"
echo -e "   $green  9)$NC $yell Remove reboot log$NC"
echo -e  "$PURPLE    =============================================$NC"
echo -e "$red Press CTRL+C to return$NC"
read -p " Select options from (1-9):" x

if test $x -eq 1; then
echo "10 * * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been set every an hour."
elif test $x -eq 2; then
echo "10 */6 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 6 hours."
elif test $x -eq 3; then
echo "10 */12 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set every 12 hours."
elif test $x -eq 4; then
echo "10 0 * * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a day."
elif test $x -eq 5; then
echo "10 0 */7 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a week."
elif test $x -eq 6; then
echo "10 0 1 * * root /usr/local/bin/reboot_otomatis" > /etc/cron.d/reboot_otomatis
echo "Auto-Reboot has been successfully set once a month."
elif test $x -eq 7; then
rm -f /etc/cron.d/reboot_otomatis
echo "Auto-Reboot successfully TURNED OFF."
elif test $x -eq 8; then
if [ ! -e /root/log-reboot.txt ]; then
	echo "No reboot activity found"
	else 
	echo 'LOG REBOOT'
	echo "-------"
	cat /root/log-reboot.txt
fi
elif test $x -eq 9; then
echo "" > /root/log-reboot.txt
echo "Auto Reboot Log successfully deleted!"
else
echo "Options Not Found In Menu"
exit
fi
