#!/bin/bash

. /usr/src/mor/x5/framework/bash_functions.sh
. /usr/src/mor/x5/framework/settings.sh


if [ -f /etc/mor/system.conf ]; then

  report "System file already present" 3

else

  mkdir -p /etc/mor
  cp -fr /usr/src/mor/x5/system.conf /etc/mor/system.conf

  report "System file created" 0

fi
