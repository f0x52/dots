#!/bin/bash
#
clock() {
	date '+%Y-%m-%d %H:%M'
}

battery() {
	BAT0C=/sys/class/power_supply/BAT0/capacity
	BAT1C=/sys/class/power_supply/BAT1/capacity
	BATS=/sys/class/power_supply/BAT1/status
	test "`cat $BATS`" = "Charging" && echo -en '\ue23a' || test "`cat $BATS`" = "Full" && echo -en '\ue238' || echo -en '\ue237'
    echo $(cat $BAT0C)"% "
    echo $(cat $BAT1C)"%"
}

volume() {
	echo -en "%{A:amixer sset Master toggle:}%{A4:amixer set Master 5%+:}%{A5:amixer set Master 5%-:}"
	test "`amixer | grep 'Playback' | grep '\[on\]' `" && echo -en "\ue050" || echo -en "\ue04f"
	amixer get Master | sed -n 's/^.*\[\([0-9]\+%\).*$/\1/p' | head -n1
	echo -en "%{A}%{A}%{A}"
}

nowplaying() {
	echo -en "%{A:st -e ncmpcpp:}\ue03d%{A} "
	echo -n "%{A1:mpc prev:}%{A2:mpc toggle:}%{A3:mpc next:}"
	echo $(mpc current -f "[%title%]|[%file%]" | sed 's/^.*\///;s/.mp3$//;s/.flac$//')
	echo -n "%{A}%{A}%{A}"
}

network() {
	test "`ip link | grep 'state UP' | awk -F: '{ print $2 }' | sed 's/ //'`" = "wlan0" && echo -en '\ue63e' || echo -n ""
	strength=`wpa_cli signal_poll | grep "^RSSI=-" | sed "s/RSSI=-//"`
	echo -n " $strength"
}

vpn() {
#	test "`ip link | grep "tun0" | awk -F: '{ print $2 }'`" = " tun0" && echo -en "%{B#757c36} VPN ACTIVE %{B-}" || echo -en "%{B#853535} VPN INACTIVE %{B-}"
	test "`ip link | grep "tun0" | awk -F: '{ print $2 }'`" = " tun0" && echo -en "%{U#757c36}%{+u} VPN %{-u}%{U-}" || echo -en "%{U#812000}%{+u} VPN %{-u}%{U-}"
}

sshd() {
	test "`ps -aux | grep sshd | grep root`" && echo -en "%{U#757c36}%{+u} SSHD %{-u}%{U-}" || echo -en "%{U#812000}%{+u} SSHD %{-u}%{U-}"
}

window_title() {
    xdotool getwindowfocus getwindowname
}

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
	buf="%{O1}"
	buf="${buf} $(vpn) $(sshd)%{c}"
    buf="${buf} %{U#36647c}%{+u}%{O100}$(window_title)%{O100}%{-u}%{r}"
#	buf="${buf} $(network)%  "
	buf="${buf}%{U#7c5536}%{+u} $(battery) %{-u}  "
	buf="${buf}%{U#7c364b}%{+u} $(volume) %{-u} "
 # test "`mpc current`" = "" && buf="${buf}" || buf="${buf}$(nowplaying) "
	buf="${buf} %{U#67367c}%{+u} $(clock) %{O2}%{-u}%{O2} %{F-}"
	echo $buf
    #make sleep dependent on battery state (charging)
	sleep 0.4
done
