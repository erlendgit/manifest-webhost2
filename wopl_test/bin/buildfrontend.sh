#!/usr/bin/env bash

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

cd $WOPL_TEST_HOME/project/frontend

set -o allexport
source .env
set +o allexport

nvm use 20

npm install
npm run build
