#!/bin/bash

sink=$(pactl list sinks | grep -E "Sink#*")
sink=${sink##*#}

if [ "$1" == "mute" ];
then
	$(pactl set-sink-mute $sink toggle)
fi

if [ "$1" == "inc" ];
then
	$(pactl set-sink-volume $sink +$2%)
fi


if [ "$1" == "dec" ];
then
	$(pactl set-sink-volume $sink -$2%)
fi
