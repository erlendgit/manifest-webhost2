#!/usr/bin/env bash

if [[ $(whoami) != 'root' ]]; then
  echo "Should run as root"
  exit 2
fi

cd $CONFIGURATION_ROOT

runuser $HSRP_PROJECT_USER -s /bin/bash -- helliot_srp/etc/create-backup.sh