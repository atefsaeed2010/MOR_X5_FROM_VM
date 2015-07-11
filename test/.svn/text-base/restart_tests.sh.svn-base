#!/bin/bash

killall -9 mor_test_run.sh
killall -9 ruby
killall -9 firefox
service mysqld restart # For "Subsystem locked" problem in order the system would be able to recover
ps aux | grep mor | grep -v restart | awk  '{print $2}' | xargs kill -9
rm -fr /tmp/.mor_test_is_running
