#!/bin/bash

initialbrightness=$(cat /sys/class/backlight/intel_backlight/brightness)
step=250
brightness=$((initialbrightness+step))
maxbrightness=$(( 7500 -$step))
minbrightness=$(( 0 + $step))
if [ "$1" == "inc" ];
then
	if (( $initialbrightness < $maxbrightness ));
	then
		brightness=$((initialbrightness+step))
		$(echo $brightness > /sys/class/backlight/intel_backlight/brightness)
	else
		$(echo $maxbrightness > /sys/class/backlight/intel_backlight/brightness)
	fi
fi


if [ "$1" == "dec" ];
then
	
	if (( $initialbrightness >$minbrightness ));
	then
		brightness=$((initialbrightness-step))
		$(echo $brightness > /sys/class/backlight/intel_backlight/brightness)
	else
		$(echo 0 > /sys/class/backlight/intel_backlight/brightness)
	fi
fi


