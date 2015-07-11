#!/bin/bash

. /usr/src/mor/x5/framework/bash_functions.sh

if [ -f /etc/init.d/memcached ]; then
    report "Memcached already installed" 0
else
    yum -y install memcached
    chkconfig --levels 2345 memcached on
    /etc/init.d/memcached restart

    if [ -f /etc/init.d/memcached ]; then
	report "Memcached installed" 4
    else
	report "Failed to install memcached. Try to do it manually" 1
    fi
fi
