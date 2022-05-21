#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


exec nitrogen --random --set-zoom-fill /usr/share/backgrounds/archlinux/ &

exec picom -f &
exec xhost + &
exec pulseaudio -D &
#exec xautolock -time 30 -locker slock -detectsleep & 
exec xautolock -time 60 -locker "systemctl suspend" -detectsleep &
exec dbus-launch --sh-syntax --exit-with-session bspwm 
