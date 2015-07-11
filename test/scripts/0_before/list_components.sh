#! /bin/sh

# Author:   Nerijus Sapola
# Company:  Kolmisoft
# Year:     2012
# About:    Script lists components of MOR billing, which should be running on current server.

. /usr/src/mor/test/framework/bash_functions.sh
. /usr/src/mor/test/framework/settings.sh

report "MOR components which should be running on this server:" 3

read_mor_asterisk_settings
if [ "$ASTERISK_PRESENT" == 1 ]; then
    echo "Asterisk"
    asterisk_is_running
    if [ "$?" != "0" ]; then
        report "Asterisk is not running!" 1
    fi
fi

read_mor_gui_settings
if [ "$GUI_PRESENT" == 1 ]; then
    echo "GUI"
    apache_is_running
    if [ "$?" != "0" ]; then
        report "Apache is not running!" 1
    fi
fi

read_mor_db_settings
if [ "$DB_PRESENT" == 1 ]; then
    echo "Database"
    mysql_is_running
    if [ "$?" != "0" ]; then
        report "MySQL is not running!" 1
    fi
    
    read_mor_replication_settings
    if [ "$DB_MASTER_MASTER" == "yes" ]; then
        echo "Master<>Master replication"
    elif [ "$REPLICATION_S" == "1" ]; then
        echo "Master>Slave replication, this server is SLAVE"
    elif [ "$REPLICATION_M" == "1" ]; then
        echo "Master>Slave replication, this server is MASTER"
    fi
fi
