#!/bin/sh

# use `xinput list` to find out your device name
mouse_id=$(xinput list | grep "DeathAdder" | grep "pointer" | grep -v "Keyboard"| cut -f 2 | grep -o '[0-9]\+')
touchpad_id=$(xinput list | grep "PNP0C50:01 04F3:30D8 Touchpad" | grep "pointer" | grep -v "Keyboard"| cut -f 2 | grep -o '[0-9]\+')

xinput set-prop $touchpad_id "libinput Scrolling Pixel Distance" 50

xinput --set-prop "$mouse_id" 'libinput Accel Profile Enabled' 0 0 1
xinput --set-prop "$mouse_id" 'libinput Accel Custom Motion Step' 1.0
xinput --set-prop "$mouse_id" 'libinput Accel Custom Motion Points' 0.0 0.20
