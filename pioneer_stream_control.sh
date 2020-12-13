#!/bin/bash
#
# Kayhan KAYNAR 2020
# kayhan.kaynar@hotmail.com

streameronlinefile=/tmp/streameronline.txt

#shairplay listens on port:5000 for streams.
streamer_online_check () {
OUTPUT=$(ss -4 | grep 5000)
if [ $? == 0 ] 
then
   echo "connected"
else 
   echo "notconnected"
fi
}

while :
do

if [ $(streamer_online_check) == connected ]
then
    if [ ! -e $streameronlinefile ]
    then
    touch $streameronlinefile
    CLIP=$(ss -4 | grep 5000 | cut -d ":" -f2 - | cut -d ":" -f1 - | cut -d " " -f18- )
    NAME=$(host $CLIP | cut -d " " -f5-  | cut -d "." -f-1 - )
    logger -t streameronline -- Streamer $NAME has joined from IP : $CLIP , Pioneer AMP is powering on
    irsend SEND_START PIONEER KEY_POWER2
    sleep 0.5
    irsend SEND_STOP PIONEER KEY_POWER2
    echo "Streamer ON, Pioneer AMP is powering on."
    fi
elif [ $(streamer_online_check) == notconnected ]
then
    if [ -e $streameronlinefile ]
    then
    rm $streameronlinefile
    logger -t streameroffline -- Pioneer AMP is shutting on.
    irsend SEND_START PIONEER KEY_POWER2 
    sleep 0.5
    irsend SEND_STOP PIONEER KEY_POWER2
    echo "Streamer OFF, Pioneer AMP is shutting down. "
    fi
fi

sleep 1

done
