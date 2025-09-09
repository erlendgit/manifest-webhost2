#!/usr/bin/env bash

if [[ $(whoami) != "root" ]]; then
  echo "Should run as root"
  exit 2
fi

cd $WOPL_TEST_HOME

rm -rf venv

service wopl-test-backend restart