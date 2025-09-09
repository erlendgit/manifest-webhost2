#!/usr/bin/env bash

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME

if [[ ! -d venv ]]; then
  echo "Should have venv"
  exit 2
fi

source venv/bin/activate

cd project/backend2

set -o allexport
source .env
set +o allexport

python manage.py "$@"
