#!/bin/bash

systemctl daemon-reload
systemctl restart v2ray
systemctl restart v2ray@none
systemctl restart v2ray@vless
systemctl restart v2ray@vnone
systemctl restart xray.service
systemctl restart xray@none.service
systemctl restart xray@vless.service
systemctl restart xray@vnone.service
systemctl restart xray@tcp_xtls.service
systemctl restart trojan
systemctl restart shadowsocks-libev
systemctl restart ssrmu
systemctl restart wg-quick@wg0
systemctl restart ssh
systemctl restart stunnel4
systemctl restart dropbear
systemctl restart openvpn
systemctl restart nginx
systemctl restart squid
systemctl restart cron
systemctl restart fail2ban
systemctl restart vnstat
