#!/usr/bin/env bash

cd $WOPL_TEST_PROJECT_ROOT

source venv/bin/activate

cd backend2
set -o allexport
source .env
set +o allexport

LOGFILE="$WOPL_TEST_HOME/logs/migrations.log"

{
  echo "----------------------------------------------------------"
  echo "Starting migrations at $(date)"
  echo "----------------------------------------------------------"
  python manage.py migrate
} >> "$LOGFILE" 2>&1

