#!/usr/bin/bash
#sleep 5
mapfile -t display_list < <(xrandr | grep  " connected " | awk '{ print $1}')

echo ${display_list[1]}
if [ -z "${display_list[1]}" ]
then
      echo "No display connected, switching on default display..."
      xrandr --output eDP1 --auto
      xrandr --output ${display_list[1]} --off 
else
      echo "Display ${display_list[1]}, switching off default display..."
      xrandr --output ${display_list[1]} --auto
      xrandr --output eDP1 --off
fi
