#!/usr/bin/env bash

cd $WOPL_TEST_HOME/project/frontend

set -o allexport
source .env
set +o allexport

npm install
npm run build
