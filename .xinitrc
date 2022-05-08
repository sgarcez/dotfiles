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

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xinput set-prop 12 307 0.3
xinput set-prop 8 307 0.3

setxkbmap -option compose:ralt
# xrandr --output DP-0 --scale 1.25x1.25
# xrandr --dpi 218.58 --output DP-0 --scale 1x1
xrandr --dpi 218.58 --output DP-0 --scale 1.13x1.13
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_QPA_PLATFORMTHEME="qt5ct"
exec i3
