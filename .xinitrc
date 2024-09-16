#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

bash /home/tim/.scripts/keyboard_setup.sh

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

# must be disabled when enabling vfio
#xrandr --setprovideroutputsource modesetting NVIDIA-0

#bash /home/tim/xinit.conf.d/monitor_setup_intel.sh
#bash /home/tim/xinit.conf.d/monitor_setup.sh
#xrandr --output eDP-2 --primary --auto
autorandr --change --skip-option crtc
bash /home/tim/.scripts/mouse_setup.sh

#bash /home/tim/.config/polybar/launch.sh
#xrandr -q 

xrandr --auto # trying to fix X black screen
nitrogen --restore &
#DISPLAY=":0" picom --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
#DISPLAY=":1" picom --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
#DISPLAY=":2" picom --fade-in-step=1 --fade-out-step=1 --fade-delta=0 &
exec /usr/bin/qtile start
