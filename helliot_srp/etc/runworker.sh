#!/usr/bin/env bash

# Exit on error
set -e

echo "\n\n===\nStarted at $(date)\n===\n"
source /etc/environment

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME
source venv/bin/activate

cd $WOPL_TEST_HOME/project/backend2

set -o allexport
source .env
set +o allexport

python manage.py rqworker default
