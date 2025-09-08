#!/usr/bin/env bash

cd $WOPL_TEST_HOME

rm -rf venv
python3.13 -m venv venv
source venv/bin/activate
pip install -r project/backend2/requirements.prod.txt

cd $WOPL_TEST_HOME/project/backend2

set -o allexport
source .env
set +o allexport

python manage.py migrate

uvicorn _django.asgi:application --port $WOPL_TEST_BACKEND_BACKEND_PORT --host 0.0.0.0
