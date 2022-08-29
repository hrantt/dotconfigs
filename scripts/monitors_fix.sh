#!/usr/bin/bash
#sleep 5
export XAUTHORITY=/home/$USERNAME/.Xauthority 
export DISPLAY=:0 
mapfile -t display_list < <(xrandr | grep  " connected " | awk '{ print $1}')

echo ${display_list[1]}
if [ -z "${display_list[1]}" ]
then
      echo "No display connected, switching on default display..."
      xrandr --output eDP-1 --auto
      xrandr --output ${display_list[1]} --off 
      #bspc monitor eDP-1 -d I II III IV V VI VII VIII IX X
      export monitor=eDP-1
      bspc wm --reorder-monitors ${display_list[1]} eDP-1
else
      echo "Display ${display_list[1]}, switching off default display..."
      #xrandr --output DP-1 --same-as eDP-1
      xrandr --output ${display_list[1]} --auto
      xrandr --output eDP-1 --off
      #bspc monitor DP-1 -d 1 2 3 4 5 6 7 8 9 10
      export monitor=${display_list[1]}
      bspc wm --reorder-monitors eDP-1 ${display_list[1]}
fi
bspc desktop Desktop --remove
