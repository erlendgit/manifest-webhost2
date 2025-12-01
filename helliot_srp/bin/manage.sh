#!/usr/bin/env bash

if [[ $(whoami) != $HSRP_DAEMON_USER ]]; then
  echo "Should run as $HSRP_DAEMON_USER"
  exit 2
fi

cd $HSRP_HOME

if [[ ! -d venv ]]; then
  echo "Should have venv"
  exit 2
fi

source venv/bin/activate

cd project

set -o allexport
source .env
set +o allexport

cd src

python manage.py "$@"
