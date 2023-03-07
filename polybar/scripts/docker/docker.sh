#!/bin/bash
status=$(systemctl status docker | grep active | awk '{print $2}')
if [[ $status = 'inactive' || $status = 'failed' ]]; then
	echo "%{F#e53935}"
else
	active_containers=$(docker ps | wc -l)
	if [ ${active_containers} -gt 1 ]; then
		echo "%{F#F79824}"
	else
		echo "%{F#ffffff}"
	fi
fi
