#!/bin/bash

test -f /tmp/ipobj && [ $(wc -l /tmp/ipobj | cut -d" " -f1) == "1" ] && { \
	var=$(grep -e '^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}$' /tmp/ipobj); \
	[ -z $var ] && echo '{"text":"Disconnected","class":"disconnected","percentage":0}' \
		|| echo '{"text": "'$var'","class":"connected","percentage":100}'
} \
|| echo '{"text":"Disconnected","class":"disconnected","percentage":0}'
