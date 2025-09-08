#!/usr/bin/env bash

# Exit on error
set -e

echo "\n\n===\nStarted at $(date)\n===\n"
source /etc/environment

env

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME

rm -rf venv
python3.13 -m venv venv
source venv/bin/activate
pip install -r project/env/backend/requirements.prod.txt
# add: python-dateutil==2.9.0.post0

cd $WOPL_TEST_HOME/project/backend2

set -o allexport
source .env
set +o allexport

python manage.py migrate

uvicorn _project.asgi:application --port $WOPL_TEST_BACKEND_BACKEND_PORT --host 0.0.0.0
