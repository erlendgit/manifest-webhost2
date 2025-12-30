#!/usr/bin/env bash

echo "enter manage.sh"

if [[ $(whoami) != $HSRP_DAEMON_USER ]]; then
  echo "Should run as $HSRP_DAEMON_USER"
  exit 2
fi

echo "User okay..."
cd $HSRP_HOME

if [[ ! -d venv ]]; then
  echo "Should have venv"
  exit 2
fi

echo "venv okay..."
source venv/bin/activate

cd project

echo "at project..."
set -o allexport
source .env
set +o allexport

echo "at src..."
cd src

echo "Python version: $(python --version)"
python manage.py "$@"
