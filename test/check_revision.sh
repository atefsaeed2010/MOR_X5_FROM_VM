#! /bin/sh
# Company:  Kolmisoft
# Author:   Gilbertas Matusevičius
# Year:     2013
# About:    Updates to latest stable revision

. /usr/src/mor/test/framework/bash_functions.sh

svn update /usr/src/mor

STABLE_REVISION=$(head -n 1 /usr/src/mor/upgrade/x4/stable_revision)
svn_last_change_info


if [ "$LAST_SVN_CHANGE_REVISION" -ne  "$STABLE_REVISION" ]; then
    /usr/src/mor/upgrade/x4/fix.sh "NO_SCREEN"
    /root/working/mor_demo/make_mor_demo_db_backup.sh
fi
