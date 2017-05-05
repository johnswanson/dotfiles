#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

xbindkeys
xsetroot -cursor_name left_ptr
xautolock -time 2 -locker "slock" &
dunst &
xmodmap ~/.Xmodmap
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0 || echo "failed, that's ok"
if [ -x /home/jds/.screenlayout/home.sh ]
then
    ~/.screenlayout/home.sh
fi
exec xmonad
