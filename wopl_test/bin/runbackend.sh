#!/usr/bin/env bash

cd $WOPL_TEST_PROJECT_ROOT

source venv/bin/activate

cd backend2
set -o allexport
source .env
set +o allexport

uvicorn _django.asgi:application --port $WOPL_TEST_BACKEND_BACKEND_PORT --host 0.0.0.0
