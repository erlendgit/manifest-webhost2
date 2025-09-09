#!/usr/bin/env bash

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME/project/frontend

source "~/.bashrc"

set -o allexport
source .env
set +o allexport

npm install
npm run build
