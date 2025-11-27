#!/usr/bin/env bash

# Exit on error
set -e

if [[ $(whoami) != "root" ]]; then
  echo "Should run as root"
  exit 2
fi

service wopl-test-backend restart
service wopl-test-worker restart