#!/bin/sh
 
echo "%{F#000000} %{F#414244}$(/usr/sbin/ifconfig wlp2s0 | grep "inet " | awk '{print $2}')%{u-}"
