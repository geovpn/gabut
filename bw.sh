#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
cyan='\x1b[96m'
white='\x1b[37m'
bold='\033[1m'
off='\x1b[m'

echo -e ""
echo -e "${red}======================================${off}"
echo -e        "           BANDWITH MONITOR "
echo -e "${red}======================================${off}"
echo -e "${white}"
echo -e "     1 =>   Lihat Total Bandwith Tersisa"
echo -e "     2 =>   Tabel Penggunaan Setiap 5 Menit"
echo -e "     3 =>   Tabel Penggunaan Setiap Jam"
echo -e "     4 =>   Tabel Penggunaan Setiap Hari"
echo -e "     5 =>   Tabel Penggunaan Setiap Bulan"
echo -e "     6 =>   Tabel Penggunaan Setiap Tahun"
echo -e "     7 =>   Tabel Penggunaan Tertinggi"
echo -e "     8 =>   Statistik Penggunaan Setiap Jam"
echo -e "     9 =>   Lihat Penggunaan Aktif Saat Ini"
echo -e "    10 =>   Lihat Trafik Penggunaan Aktif Saat Ini [5s]"
echo -e "     x =>   Keluar"
echo -e "${off}"
echo -e "${red}======================================${off}"
echo -e "${white}"
read -p "     [#]  Masukkan Nomor :  " noo
echo -e "${off}"

case $noo in
1)
echo -e "${red}======================================${off}"
echo -e "    TOTAL BANDWITH SERVER TERSISA"
echo -e "${red}======================================${off}"
echo -e ""

vnstat

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

2)
echo -e "${red}======================================${off}"
echo -e "  PENGGUNAAN BANDWITH SETIAP 5 MENIT"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -5

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

3)
echo -e "${red}======================================${off}"
echo -e "    PENGGUNAAN BANDWITH SETIAP JAM"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -h

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

4)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP HARI"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -d

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

5)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP BULAN"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -m

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

6)
echo -e "${red}======================================${off}"
echo -e "   PENGGUNAAN BANDWITH SETIAP TAHUN"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -y

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

7)
echo -e "${red}======================================${off}"
echo -e "    PENGGUNAAN BANDWITH TERTINGGI"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -t

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

8)
echo -e "${red}======================================${off}"
echo -e " GRAFIK BANDWITH TERPAKAI SETIAP JAM"
echo -e "${red}======================================${off}"
echo -e ""

vnstat -hg

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

9)
echo -e "${red}======================================${off}"
echo -e "  LIVE PENGGUNAAN BANDWITH SAAT INI"
echo -e "${red}======================================${off}"
echo -e " ${white}CTRL+C Untuk Berhenti!${off}"
echo -e ""

vnstat -l

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

10)
echo -e "${red}======================================${off}"
echo -e "   LIVE TRAFIK PENGGUNAAN BANDWITH "
echo -e "${red}======================================${off}"
echo -e ""

vnstat -tr

echo -e ""
echo -e "${red}======================================${off}"
echo -e "$baris2"
;;

x)
sleep 1
menu
;;

*)
sleep 1
echo -e "${red}Nomor Yang Anda Masukkan Salah!${off}"
bw
;;
esac
