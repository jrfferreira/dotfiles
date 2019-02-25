#!/bin/bash

change=10

while getopts "id?:" OPT
do
    case $OPT in
	d) echo "bright -"
	   change=9
	   ;;
	i) echo "bright +"
	   change=11
	   ;;
    esac
done

cur_bright=$(pkexec xfpm-power-backlight-helper --get-brightness)
next_bright=$(($cur_bright*$change/10))

pkexec xfpm-power-backlight-helper --set-brightness $next_bright
