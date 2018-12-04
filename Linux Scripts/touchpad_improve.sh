#!/bin/bash
synclient TapButton3=2
synclient TapButton2=3
synclient HorizTwoFingerScroll=0
synclient PalmDetect=1
synclient PalmMinWidth=1
synclient PalmMinZ=10
synclient VertScrollDelta=60
synclient MaxSpeed=8
synclient MinSpeed=1.5
synclient HorizEdgeScroll=1
synclient VertTwoFingerScroll=1
synclient AreaRightEdge=3650
synclient AreaTopEdge=74
synclient AreaLeftEdge=104
synclient AreaBottomEdge=2470

for i in `seq 1 20`;
do
if pgrep -x "syndaemon" >/dev/null
then
	killall syndaemon
	syndaemon -i 0.2 -d -K -R
	break
else 
	syndaemon -i 0.2 -d -K -R
	sleep 5
fi
done
