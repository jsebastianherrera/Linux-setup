#!/bin/bash
output="$(bluetoothctl show | grep 'Powered' | awk '{print $2}')"
if [ $output = 'yes' ];
then
  bluetoothctl power off
else
  bluetoothctl power on
fi 
