#!/bin/bash
lxsession &
xfsettingsd &
picom &
dunst &
xrandr --output HDMI-0 --mode 3440x1440 --rate 180 &
slstatus &
nitrogen --restore &
exec dwm
