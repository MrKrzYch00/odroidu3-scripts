#!/bin/sh
# Starts 2 VNC displays at 5911 and 5912 ports
vncserver :11 -geometry 1280x720 -deferupdate 50
vncserver :12 -geometry 1280x720 -deferupdate 50
export DISPLAY=:11
fluxbox &
xterm &
export DISPLAY=:12
fluxbox &
xterm &
