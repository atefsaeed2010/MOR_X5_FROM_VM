#!/bin/bash

exec >  >(tee -a install.log)
exec 2> >(tee -a install.log >&2)

echo "Starting MOR X5 installation..."
echo `date`

src="/usr/src/mor/x5"


# check for rvm presence to detemrine if server is empty or not
if [ -f '/usr/local/rvm/bin/rvm' ]; then
    . /usr/src/mor/x5/framework/bash_functions.sh
    report "System is not empty, aborting installation" 6
    exit 0
fi

# system update
#yum -y update # need reboot after that


# for DB/GUI/CORE servers
# environment check
$src/maintenance/vm_detection.sh
$src/maintenance/dns_check.sh # todo: we should terminate if dns does not work

# environment preparation
$src/maintenance/time_sync.sh
echo `date` # after sync we will get better time
$src/maintenance/selinux_disable.sh
$src/maintenance/yum_updatesd_disable.sh
$src/maintenance/iptables_clean.sh
$src/maintenance/time_sync.sh
$src/maintenance/ssl_fix_heartbleed.sh
$src/maintenance/configuration_prepare.sh
$src/maintenance/folders_permissions_prepare.sh
#$src/maintenance/aliases_install.sh

# necessary for DB/GUI servers
$src/gui/rvm_install.sh
$src/gui/ruby_install.sh

# for DB server
$src/mysql/mysql_install.sh
$src/db/db_create.sh NEW

# for GUI server
$src/gui/apache_install.sh
$src/gui/passenger_install.sh
$src/gui/memcached_install.sh
$src/gui/gui_install.sh
$src/mysql/phpmyadmin_install.sh

# Asterisk
$src/asterisk/asterisk_install.sh
$src/core/core_install_10cc.sh

# Helper packages
$src/helpers/lame_install.sh
$src/helpers/elunia_stats_install.sh
$src/helpers/fail2ban_install.sh
$src/helpers/iperf_install.sh
$src/helpers/phpsysinfo_install.sh

# Scripts
$src/scripts/scripts_install.sh

# Final touches
$src/maintenance/logrotates_enable.sh
$src/maintenance/permissions_post_install.sh
$src/maintenance/alias_activate.sh

# major check/fix
$src/info.sh

echo `date`
