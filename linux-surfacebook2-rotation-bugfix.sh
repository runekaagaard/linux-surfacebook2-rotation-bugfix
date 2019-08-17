#!/bin/bash

INTERFACE=org.gnome.Mutter.DisplayConfig
MEMBER=MonitorsChanged
PREV_ROT="UNDEFINED"
MON="eDP-1"
TOUCHSCREEN="ipts 045E:0020 Touchscreen"

dbus-monitor --profile "interface='$INTERFACE',member='$MEMBER'" |
    while read -r line; do
	echo $line | grep -v $MEMBER && continue
	XRANDR=$(xrandr | grep $MON)
	ROT="normal"
	echo $XRANDR | grep "+0 (" && ROT="normal"
	echo $XRANDR | grep "+0 right (" && ROT="right"
	echo $XRANDR | grep "+0 inverted (" && ROT="inverted"
	echo $XRANDR | grep "+0 left (" && ROT="left"
	[ $ROT == $PREV_ROT ] && continue
	[ $ROT == "left" ]     && xinput set-prop "$TOUCHSCREEN" --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1  && echo "Rotation changed to left"
	[ $ROT == "right" ]    && xinput set-prop "$TOUCHSCREEN" --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1  && echo "Rotation changed to right"
	[ $ROT == "normal" ]   && xinput set-prop "$TOUCHSCREEN" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0   && echo "Rotation changed to normal"
	[ $ROT == "inverted" ] && xinput set-prop "$TOUCHSCREEN" --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1 && echo "Rotation changed to inverted"
	PREV_ROT="$ROT"
    done
