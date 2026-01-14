#!/usr/bin/env bash

# Exit on error
set -e

echo "\n\n===\nStarted at $(date)\n===\n"
source /etc/environment

if [[ $(whoami) != $HSRP_DAEMON_USER ]]; then
  echo "Should run as $HSRP_DAEMON_USER"
  exit 2
fi

cd $HSRP_HOME
source venv/bin/activate

cd project/src

set -o allexport
source ../.env
set +o allexport

python manage.py migrate

uvicorn _django.asgi:application --port $HSRP_BACKEND_PORT --host 0.0.0.0
