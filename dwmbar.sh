#!/bin/bash

time=$(date +%S)

if [ $time != '00' ]; then

	sleep $(expr 60 - $time)
	while true; do
		xsetroot -name "$(date +'%a %b %I:%M %p') \
| Battery: $(acpi | awk '{print $4}' | sed s/,// | head -n 1) \
| Updates: $(checkupdates | wc -l)  "
		sleep 59
	done

else

	while true; do
		xsetroot -name "$(date +'%a %b %I:%M:%S %p') \
| Battery: $(acpi | awk '{print $4}' | sed s/,// | head -n 1) \
| Updates: $(checkupdates | wc -l)  "
		sleep 59
	done

fi
