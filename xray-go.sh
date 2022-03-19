#!/bin/bash
# Xray Auto Setup 
# =========================
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
# Domain 
domain=$(cat /etc/v2ray/domain)

# Uuid Service
uuid=$(cat /proc/sys/kernel/random/uuid)

# INSTALL XRAY
curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh | bash -s -- install
cd /usr/local/etc/xray/
rm config.json
cd
chown -R nobody.nogroup /etc/v2ray/v2ray.crt
chown -R nobody.nogroup /etc/v2ray/v2ray.key

cat> /usr/local/etc/xray/config.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 9443,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid}",
            "alterId": 2
#tls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificatefile": "/etc/v2ray/v2ray.crt",
              "keyfile": "/etc/v2ray/v2ray.key"
            }
          ]
        },
        "wsSettings": {
          "path": "/xray",
          "headers": {
            "Host": ""
          }
         },
        "quicSettings": {},
        "sockopt": {
          "mark": 0,
          "tcpFastOpen": true
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "domain": "$domain"
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  }
}
END
cat> /usr/local/etc/xray/none.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 90,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid}",
            "alterId": 2
#none
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/xray",
          "headers": {
            "Host": ""
          }
         },
        "quicSettings": {},
        "sockopt": {
          "mark": 0,
          "tcpFastOpen": true
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "domain": "$domain"
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  }
}
END
cat> /usr/local/etc/xray/tcp_xtls.json << END
{
    "log": {
        "loglevel": "warning"
    }, 
    "inbounds": [
        {
            "listen": "0.0.0.0", 
            "port": 443, 
            "protocol": "vless", 
            "settings": {
                "clients": [
                    {
                        "id": "${uuid}"
#xtls
                    }
                ], 
                "decryption": "none", 
                "fallbacks": [
                    {
                        "dest": 60000,
                        "alpn": "",
                        "xver": 1
                    }, 
                    {
                        "dest": 60001, 
                        "alpn": "h2",
                        "xver": 1
                    },
                    {
                        "dest": 60002, 
                        "path": "/xray",
                        "xver": 1
                    }                    
                ]
            }, 
            "streamSettings": {
                "network": "tcp", 
                "security": "xtls", 
                "xtlsSettings": {
                    "serverName": "$domain", 
                    "alpn": [
                        "h2", 
                        "http/1.1"
                    ], 
                    "certificates": [
                        {
                            "certificatefile": "/etc/v2ray/v2ray.crt", 
                            "keyfile": "/etc/v2ray/v2ray.key"
                        }
                    ]
                }
            }
        }
    ], 
    "outbounds": [
        {
            "protocol": "freedom", 
            "settings": { }
        }
    ]
}
END
cat> /usr/local/etc/xray/vless.json << END
{
  "log": {
    "access": "/var/log/xray/access2.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 543,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid}"
#tls
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificatefile": "/etc/v2ray/v2ray.crt",
              "keyfile": "/etc/v2ray/v2ray.key"
            }
          ]
        },
        "wsSettings": {
          "path": "/xray",
          "headers": {
            "Host": ""
          }
         },
        "quicSettings": {},
        "sockopt": {
          "mark": 0,
          "tcpFastOpen": true
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  }
}
END
cat> /usr/local/etc/xray/vnone.json << END
{
  "log": {
    "access": "/var/log/xray/access2.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 643,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid}"
#none
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/xray",
          "headers": {
            "Host": ""
          }
         },
        "quicSettings": {},
        "sockopt": {
          "mark": 0,
          "tcpFastOpen": true
        }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      },
      "domain": "$domain"
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  }
}
END

# xray
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 9443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 90 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 643 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
# xray
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 9443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 90 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 543 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 643 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables-save >/etc/iptables.rules.v4
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload

# Starting
systemctl daemon-reload
systemctl restart xray
systemctl enable xray
systemctl restart xray.service
systemctl enable xray.service
systemctl enable xray@none.service
systemctl start xray@none.service
systemctl enable xray@vless.service
systemctl start xray@vless.service
systemctl enable xray@vnone.service
systemctl start xray@vnone.service
systemctl enable xray@tcp_xtls.service
systemctl start xray@tcp_xtls.service

cd /usr/bin
wget -O add-xtls "https://istriku.me/gabut/add-xtls.sh"
wget -O del-xtls "https://istriku.me/gabut/del-xtls.sh"
wget -O renew-xtls "https://istriku.me/gabut/renew-xtls.sh"
wget -O cek-xtls "https://istriku.me/gabut/cek-xtls.sh"
wget -O add-xws "https://istriku.me/gabut/add-xws.sh"
wget -O del-xws "https://istriku.me/gabut/del-xws.sh"
wget -O renew-xws "https://istriku.me/gabut/renew-xws.sh"
wget -O cek-xws "https://istriku.me/gabut/cek-xws.sh"
wget -O add-xvless "https://istriku.me/gabut/add-xvless.sh"
wget -O del-xvless "https://istriku.me/gabut/del-xvless.sh"
wget -O renew-xvless "https://istriku.me/gabut/renew-xvless.sh"
wget -O cek-xvless "https://istriku.me/gabut/cek-xvless.sh"

chmod +x add-xtls
chmod +x del-xtls
chmod +x renew-xtls
chmod +x cek-xtls
chmod +x add-xws
chmod +x del-xws
chmod +x renew-xws
chmod +x cek-xws
chmod +x add-xvless
chmod +x del-xvless
chmod +x renew-xvless
chmod +x cek-xvless

cd
wget -qO web.tar.gz "https://istriku.me/gabut/web.tar.gz"
tar xzf web.tar.gz -C /home/vps/public_html
rm -f web.tar.gz

systemctl daemon-reload
systemctl restart nginx
systemctl restart xray
systemctl status nginx
systemctl status xray
systemctl status xray@tcp_xtls.service
