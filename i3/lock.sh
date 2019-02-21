#!/bin/bash
# get current player status
player_last_status=$(playerctl metadata -f "{{lc(status)}}")

# suspend message display
pkill -u "$USER" -USR1 dunst

# pause browsers to avoid audios or videos
killall -u "$USER" -s STOP firefox
killall -u "$USER" -s STOP chrome

# pause music, no need to check if it is playing
playerctl pause > /dev/null

# lock the screen
i3lock-fancy -gf Source-Sans-Pro -- scrot -z

# resume message display
pkill -u "$USER" -USR2 dunst

# resume music if it was playing before locking
if [ $player_last_status == 'playing' ]
then
    playerctl play
fi

#resume browsers
killall -u "$USER" -s CONT firefox
killall -u "$USER" -s CONT chrome
