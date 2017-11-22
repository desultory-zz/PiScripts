#!/bin/bash
#Usage: lights.sh blink (delay in seconds) (count)
#Usage: lights.sh on/off
#Assumes that 4 gpio pins are being used which are pins 0 1 3 4 based on wiringpi

init() {
	for i in {0 1 3 4}; do
		gpio mode "$i" out
	done
}

toggle() {
	state=$(gpio read $1);
	if [ $state -eq 1 ]; then
		gpio write $1 0
	elif [ $state -eq 0 ]; then
		gpio write $1 1
	fi
}

init

if [ "$1" == "blink" ]; then
	if [ -n "$2" ]; then
		delay="$2"
	else
		delay="0.5"
	fi
	if [ -n "$3" ]; then
		count="$3"
	else
		count="5"
	fi
	for i in `seq 1 $count`; do
		sleep $delay
		for j in {0 1 3 4}; do
			toggle $j
		done
		sleep $delay
	done
fi

if [ "$1" == "off" ]; then
	for i in {0 1 3 4}; do
		gpio write "$i" 0
	done
fi

if [ "$1" == "on" ]; then
	for i in {0 1 3 4}; do
		gpio write "$i" 1
	done
fi
