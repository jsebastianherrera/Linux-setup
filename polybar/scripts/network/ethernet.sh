#!/bin/bash
up=$(ip link show dev wlp2s0 | awk '{print $9}')
if [ ${up} = 'UP' ]; then
	ethernet=$(ip addr show wlp2s0 | grep inet | head -n 1 | awk {'print $2'} | awk '{print substr($0,1,length($0)-3)}')
	echo "%{F#e53935} %{F#ffffff}${ethernet}"
else
  echo "%{F#F79824}Disconnected"

fi
