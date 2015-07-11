#! /bin/bash

# script used for nodes

. /usr/src/mor/x5/framework/bash_functions.sh

VER="2.1.2"

# some magic
source "/usr/local/rvm/scripts/rvm"


if [ `rvm list | grep $VER | wc -l` = "0" ]; then

  report "Ruby $VER not present, installing..." 2
  rvm list
  ruby -v

  cd /usr/src/mor
  svn update

  # ruby update 
  /usr/src/mor/x5/gui/ruby_install.sh

  # for reporting to brain
  gem install rest-client

  # passenger update to newer version
  /usr/src/mor/x5/gui/passenger_install.sh

  rvm use 2.1.2

  # x5 fix for node
  if [ -d "/home/x5" ]; then
    report "Upgrading gems for X5" 3
    cd /home/x5
    svn update
    bundle update
    report "Gems for X5 upgraded" 0
  fi

  # m2 fix
  if [ -d "/home/m2" ]; then
    report "Upgrading gems for M2" 3
    cd /home/m2
    svn update
    bundle update
    report "Gems for M2 upgraded" 0
  else

    # mor fix generic
    if [ -d "/home/mor" ]; then
      report "Upgrading gems for MOR" 3
      cd /home/mor
      svn update
      bundle update
      report "Gems for MOR upgraded" 0
    fi

  fi

  /etc/init.d/httpd restart

  if [ `rvm list | grep $VER | wc -l` = "0" ]; then
    report "Something bad happened, Ruby $VER not installed, contact MK" 1
    ruby -v
    rvm list
  else
    report "Ruby $VER installed" 0
  fi

else

  report "Ruby $VER present" 0

  rvm use 2.1.2

fi
