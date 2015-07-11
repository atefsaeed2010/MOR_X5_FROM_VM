#! /bin/sh

# Script to restart asterisk softly by Kolmisoft

# crontab
# 0 0 * * * /usr/local/mor/asterisk_nice_restart.sh

# tell Asterisk do not accept new calls
asterisk -rx 'stop gracefully' >/dev/null

# read all channels
asterisk -rx 'core show channels verbose' | sed '1d' > /tmp/f1
cat /tmp/f1 | awk '{split ($0,a," "); print a[11]}' > /tmp/f2 


# hangup all alive channels
for i in `cat /tmp/f2`; do 
    asterisk -rx "soft hangup $i " >/dev/null 
done 

# let asterisk to stop by itself
sleep 5

# kill remainings
killall -9 safe_asterisk
killall -9 asterisk

# start fresh and ready to work!
/etc/init.d/asterisk start


# clean
rm -rf /tmp/f1 
rm -rf /tmp/f2
