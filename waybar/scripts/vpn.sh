#!/bin/bash

test -d /proc/sys/net/ipv4/conf/tun0 \
&& { var=$(ip a | grep tun0 | grep -v "mtu" | tr "/" " " | cut -d" " -f6); \
echo '{"text": "'$var'","class":"connected","percentage":100}'
} \
|| echo '{"text":"Disconnected","class":"disconnected","percentage":0}'
