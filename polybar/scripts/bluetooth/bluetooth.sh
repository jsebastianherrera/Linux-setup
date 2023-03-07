#!/bin/bash
function paired_devices() {
  output="$(bluetoothctl paired-devices | awk '{print $2}')"
  echo "${output[@]}"
}

function already_connected(){
  bluetoothctl info | grep 'Paired: yes' > /dev/null
  if [ $? -eq 0 ];then
    echo true
  else
     echo false
  fi
}

output="$(bluetoothctl show | grep 'Powered' | awk '{print $2}')"
if [ "${output}" = 'yes' ];
then
    if [ "$(already_connected)" = true ];then
      # bluetoothctl connect $i > /dev/null 
      echo "%{F#F79824}"
    else
      echo "%{F#ffffffff}"
    fi
else 
  echo "%{F#ffffffff}"
fi
