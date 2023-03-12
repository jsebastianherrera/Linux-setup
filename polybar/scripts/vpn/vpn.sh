#!/bin/bash
lines=$( ip addr show | grep -c 'tun0'  )
if [ "$lines" -gt 0 ]; then
	tun=$( ip addr show | grep tun0 | tail -n 1 | awk '{print $2}')
	echo "%{F#e53935}%{F#ffffff} ${tun}"
else
  echo "%{F#e53935}%{F#ffffff} Disconnected"

fi
