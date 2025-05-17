#!/bin/bash
lxpolkit &
picom &
dunst &
xrandr --output HDMI-0 --mode 3440x1440 --rate 100 &
slstatus &
nitrogen --restore &
/usr/lib/xdg-desktop-portal-gtk &
exec dwm

