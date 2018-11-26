#!/bin/bash
# Replace xxx.xxx.xxx.xxxx with your Domoticz IP and PORT
# Replace NodeXXX with you Node numer eg Node001
# Number of Cliks send by FPF101
# One Click - 0x80
# Two Clicks - 0x83
# Three Clicks - 0x84
# Four Clicks - 0x85
#
# Usage fibaro_button.sh <number of clicks> <idx> <level>
tail -fn0 /home/pi/domoticz/Config/OZW_Log.txt | \
while read line ; do
echo "$line" | grep "NodeXXX, Decrypted Packet:".*"$1"
if [ $? = 0 ]
then
curl -s -i -H "Accept: application/json" "http://xxx.xxx.xxx.xxx/json.htm?type=command&param=switchlight&idx=$2&switchcmd=Set%20Level&level=$3"
fi
done