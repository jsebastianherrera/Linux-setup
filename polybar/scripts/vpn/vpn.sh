#!/bin/bash
con=$(ip addr | grep tun0 | grep inet | awk {'print $2'})
if [ ${#con} -gt 0 ]; then
	echo "%{F#414244} ${con}"
else
	echo "%{F#414244} Disconnected"
fi
