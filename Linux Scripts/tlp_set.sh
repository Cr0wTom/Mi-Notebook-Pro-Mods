#!/bin/bash

if [ "$1" == "bat" ];
then
	$(cp tlp-bat /etc/default/tlp)
	tlp start
fi

if [ "$1" == "perf" ];
then
	$(cp tlp-perf /etc/default/tlp)
	tlp start
fi

if [ "$1" == "strong" ];
then
	$(cp tlp-bat-strong /etc/default/tlp)
	tlp start
fi
