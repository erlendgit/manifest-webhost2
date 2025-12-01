#!/usr/bin/env bash

if [[ $(whoami) != 'root' ]]; then
  echo "Should run as root"
  exit 2
fi

service helliot_srp_web restart
service helliot_srp_worker restart