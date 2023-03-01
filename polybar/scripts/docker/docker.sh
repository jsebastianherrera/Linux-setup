#!/bin/bash
status=$(systemctl status docker | grep active | awk '{print $2}')
if [ $status = 'inactive' ]; then
	echo "%{F#ffffff}"
else
  echo "%{F#e53935}"
fi
