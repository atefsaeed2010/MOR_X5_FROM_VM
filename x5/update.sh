#!/bin/bash

exec >  >(tee -a update.log)
exec 2> >(tee -a update.log >&2)

# Important: Once this script is launched there is no way back to older MOR versions. You will have to reinstall the system in order to get older MOR version.

. /usr/src/mor/x5/framework/bash_functions.sh
. /usr/src/mor/x5/framework/framework.conf
. /usr/src/mor/x5/framework/mor_install_functions.sh

report "Starting X5 update/upgrade" 3

dir="/usr/src/mor/x5"


NO_SCREEN="$1"  # Option to be tolerant on running without screen
if [ "$NO_SCREEN" != "NO_SCREEN" ]; then    # require to be running from screen from now on
    are_we_inside_screen
    if [ "$?" == "1" ]; then
        report "You have to run this script from 'screen' program. To do so - just run command 'screen' and launch the script again as usual"   1
        exit 1
    fi
fi


cd /usr/src/mor
svn update
/usr/src/mor/x5/maintenance/time_sync.sh
report `date` 3


source "/etc/profile.d/rvm.sh"

#proc1(){
#} # proc1 end
# MK WIP - review till here 
#exit 0



# fix/make /etc/system.conf file
$dir/maintenance/configuration_prepare.sh

# Update to ruby 2.1.2 + passenger + bundles
cd /usr/src/mor/x5/gui/
./ruby_passenger_gui_update.sh
rvm use 2.1.2

# very nasty hack to solve no bundle problem
rm -fr /usr/local/bin/bundle &> /dev/null
ln -s /usr/local/rvm/gems/ruby-2.1.2/wrappers/bundle /usr/local/bin/bundle &> /dev/null

#=========== Main ==================================================

mkdir -p /usr/local/mor/backups/GUI
if [ $LOCAL_INSTALL == 0 ]; then
    svn co http://svn.kolmisoft.com/mor/install_script/trunk/ /usr/src/mor

    get_last_stable_mor_revision x5
    svn update -r $LAST_STABLE_GUI http://svn.kolmisoft.com/mor/install_script/trunk/db/x5/ /usr/src/mor/db/x5/ &> /dev/null

    randir=`date +%H%M%S%N`
    if [ -d /home/mor ]; then
        mor_gui_current_version
        mor_version_mapper "$MOR_VERSION"
        if [ "$MOR_MAPPED_VERSION_WEIGHT" -le "140" ]; then    # BIG CHANGES.. New project structure, etc....
	    report "Full GUI upgrade" 3

            mysql_connect_data_v2  # getting MySQL connection details

	    # gui backup
            tar -cvf /usr/local/mor/backups/GUI/mor_"$MOR_VERSION"_before_migration_to_MOR_x5_$randir.tar.gz /home/mor --exclude "/home/mor/log"
            if [ -d /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5 ]; then
                report 'Sorry, but /home/mor_'$MOR_VERSION'_BEFORE_MIGRATION_TO_MOR_x5 already exists. To avoid custom modifications you might have there I refuse to continue overwriting that directory. Remove or rename that directory if you are sure that no valuable information there is present' 1
                exit 1
            fi
            mv /home/mor /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5
            report "Checking out MOR x5 GUI from svn.kolmisoft.com, last stable rev: $LAST_STABLE_GUI" 3

	    # some nasty svn hickup fix
	    rm -fr /home/mor/app/views/shared

	    # update to X5
            svn co -r $LAST_STABLE_GUI --force http://svn.kolmisoft.com/mor/gui/branches/x5 /home/mor &> /dev/null
	    svn update -r $LAST_STABLE_GUI --force --accept theirs-full &> /dev/null

	    # preserving custom ivr_voices/ad_sounds
            cp -R /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5/public/ivr_voices /home/mor/public/ivr_voices
            chmod 666 -R /home/mor/public/ivr_voices
            cp -R /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5/public/ad_sounds /home/mor/public/ad_sounds
            chmod 666 -R /home/mor/public/ad_sounds

	    # new proper config files for GUI
            mkdir -p /home/mor/config
	    # strict=false setting should come, if db settings were changed - gui will not work, change them back manually from mor/mor/mor
            cp -rf /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5/config/database.yml /home/mor/config/database.yml
            #cp -fr /usr/src/mor/upgrade/x5/files/database.yml /home/mor/config/
            cp -rf /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5/config/environment.rb /home/mor/config/environment.rb

            if [ ! -s "/home/mor/public/fax2email" ]; then
                ln -s /var/spool/asterisk/faxes /home/mor/public/fax2email
            fi

            # Preserving Logos
            mkdir -p /home/mor/app/assets/images/logo /home/mor/tmp
            cp -R /home/mor_"$MOR_VERSION"_BEFORE_MIGRATION_TO_MOR_x5/public/images/logo/* /home/mor/app/assets/images/logo/
            chmod -R 777 /home/mor/app/assets /home/mor/tmp

            mkdir -p /home/mor/log
            chmod -R 666 /home/mor/log
            if [ "$?" == "0" ]; then
                report "MOR X5 checkout from SVN" 0
            else
                report "Failed to checkout MOR X5 GUI from svn.kolmisoft.com. Please ensure that your DNS settings in /etc/resolv.conf are correct and you can access address svn.kolmisoft.com" 1
                exit 1
            fi
        else
	    report "Simple GUI update" 3
	
	    #echo "last stable release: $LAST_STABLE_GUI"

	    # some nasty svn hickup fix
	    rm -fr /home/mor/app
	    rm -fr /home/mor/selenium

            svn co -r $LAST_STABLE_GUI --force http://svn.kolmisoft.com/mor/gui/branches/x5 /home/mor &> /dev/null
            svn update -r $LAST_STABLE_GUI --force --accept theirs-full &> /dev/null
        fi
    fi
fi

# bundle update
cd /home/mor
rvm use 2.1.2
bundle update &> /dev/null
/etc/init.d/httpd restart

# get db data
mysql_connect_data_v2

# Adding symlinks appropriate upgrade files for gui # actually removing, will not use them anymore
rm -rf /home/mor/gui_upgrade.sh /home/mor/gui_upgrade_light.sh &> /dev/null
#report "Adding symlinks to /usr/src/mor/upgrade/x5/gui_upgrade_light.sh and /usr/src/mor/upgrade/x5/gui_upgrade.sh" 3
#ln -s /usr/src/mor/upgrade/x5/gui_upgrade_light.sh /home/mor/gui_upgrade_light.sh
#ln -s /usr/src/mor/upgrade/x5/gui_upgrade.sh /home/mor/gui_upgrade.sh
#chmod +x /home/mor/gui_upgrade_light.sh /home/mor/gui_upgrade.sh

# db upgrade
/usr/src/mor/x5/db/update_x4/import_changes.sh &> /dev/null   # devices/codecs/etc upgrade
/usr/src/mor/x5/db/db_update.sh STABLE &> /dev/null


# Memcached
/usr/src/mor/x5/gui/memcached_install.sh


# logrotates
/usr/src/mor/x5/maintenance/logrotates_enable.sh

# gui upgrade
#/usr/src/mor/x5/gui/gui_upgrade.sh    # all gems are rebundled here also

#copy only if not present already
if [ ! -f /etc/asterisk/extensions_mor_didww.conf ]; then
    cp /usr/src/mor/asterisk-conf/extensions_mor_didww.conf /etc/asterisk/
fi

#copy only if not present already
if [ ! -f /etc/asterisk/extensions_mor_external_did.conf ]; then
    cp /usr/src/mor/x5/asterisk/conf/extensions_mor_external_did.conf /etc/asterisk/
fi

#copy only if not present already
if [ ! -f /etc/asterisk/asterisk.conf ]; then
    cp -fr /usr/src/mor/x5/asterisk/conf/asterisk.conf /etc/asterisk/
fi

#copy only if not present already
if [ ! -f /etc/asterisk/sip.conf ]; then
    cp -fr /usr/src/mor/x5/asterisk/conf/sip.conf /etc/asterisk/
fi

asterisk -vvvvvvrx 'extensions reload'

# agi fixes
/usr/src/mor/x5/asterisk/agi/install.sh

# ami
/usr/src/mor/x5/asterisk/ami/install.sh

# calllog
#mkdir -p /var/log/mor/calllog
#cp -fr /usr/src/mor/sh_scripts/backup_calllog.sh /usr/local/mor/

# cronjobs
cp -fr /usr/src/mor/x5/gui/cronjobs/* /etc/cron.d/
/etc/init.d/crond restart

# possible error fix
if [ ! -L /usr/local/bin/lame ]; then
    ln -s /usr/bin/lame /usr/local/bin/lame &> /dev/null
fi

/usr/src/mor/x5/mysql/configure_mycnf.sh # my.cnf configure

/usr/src/mor/x5/maintenance/folders_permissions_prepare.sh

/usr/src/mor/x5/maintenance/test_fix_scripts/asterisk/maxload_core_count.sh
/usr/src/mor/x5/maintenance/test_fix_scripts/asterisk/sip_registrations.sh
/usr/src/mor/x5/maintenance/test_fix_scripts/gui/recordings.sh
# should go after all fixes from /maintenance
/usr/src/mor/x5/maintenance/permissions_post_install.sh

cp -f /usr/src/mor/x5/framework/mor_install_functions.sh /usr/local/mor/
cp -f /usr/src/mor/x5/scripts/backups/backup_restore.sh /usr/local/mor/
cp -f /usr/src/mor/x5/scripts/backups/backup_create.sh /usr/local/mor/

/usr/src/mor/x5/scripts/scripts_install.sh

chmod -R 755 /usr/local/ #8950

/usr/src/mor/x5/asterisk/sounds_install.sh

/usr/src/mor/x5/core/core_install_10cc.sh

# run info.sh here to make sure upgrade went ok
/usr/src/mor/x5/info.sh

report "X5 update/upgrade completed" 0
report `date` 3
