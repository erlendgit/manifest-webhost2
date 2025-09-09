#!/usr/bin/env bash

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME/project/frontend

rm -rf node_modules
rm -rf dist

cd $CONFIGURATION_ROOT
bash wopl_test/bin/buildfrontend.sh