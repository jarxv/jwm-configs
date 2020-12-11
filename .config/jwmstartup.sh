#!/bin/sh 
$HOME/my\ scripts/xrandr-newmode.sh 1920 1080 64
#$HOME/my\ scripts/xrandr-newmode.sh 1600 900 60
#xrandr -s 1600900 
#killall /usr/lib/systemd/systemd
numlockx 
#xinput set-prop "Elan Touchpad"  "libinput Tapping Enabled" 1 
xset b off
#sleep 1; xpad & 
sleep 1 ; exec wbar  & 
#sleep 1;  sh my\ scripts/conky.sh  &
sleep 2;  sudo nm-applet & 
#xgamma -rgamma 1.3 -bgamma .9 -ggamma 1.3
#pulseaudio

# cat /sys/class/power_supply/BAT0/capacity
#%I:%M %Z
#  <Swallow name="xclock" width="42" height="22">
# watcher
#  </Swallow>
#  <StartupCommand>xrandr --output eDP-1 --gamma 1.1:0.8:0.7 --brightness .9 </StartupCommand>
# jwm update  global
#        while [ $x -le 4 ] ; do  cp /home/jerome/.jwmrc  "$(locate .jwmrc  | grep -v /home/jerome/.jwmrc  | grep -v /etc/jwm/system.jwmrc | grep -v /usr/share/doc/jwm/examples/example.jwmrc.gz   | head -$x | tail -1 )" ; x=$(expr $x + 1  ) ;  done
#
