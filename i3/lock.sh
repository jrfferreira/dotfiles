
#!/bin/bash

# get current player status
player_last_status=$(playerctl status)

do_lock () {
    # suspend message display
    pkill -u "$USER" -USR1 dunst

    # pause browsers to avoid audios or videos
    killall -u "$USER" -s STOP firefox > /dev/null
    killall -u "$USER" -s STOP chrome > /dev/null

    # pause music, no need to check if it is playing
    if [ $player_last_status == 'Playing' ]
    then
	playerctl pause
    fi
    
    light-locker-command -l
}

do_unlock () {
    # resume message display
    pkill -u "$USER" -USR2 dunst
	
    # resume music if it was playing before locking
    if [ $player_last_status == 'Playing' ]
    then
	playerctl play
    fi
	
    #resume browsers
    killall -u "$USER" -s CONT firefox > /dev/null
    killall -u "$USER" -s CONT chrome > /dev/null
}


# lock the screen
do_lock

# wait for unlock signal
gdbus monitor -y -d org.freedesktop.login1 | while read line; do
    grep -qo "'Active': <true>" && do_unlock;
    exit;
done; exit;

