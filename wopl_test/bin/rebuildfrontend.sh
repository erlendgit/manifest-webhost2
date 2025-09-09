#!/usr/bin/env bash

cd $WOPL_TEST_HOME/project/frontend

rm -rf node_modules
rm -rf dist

cd $CONFIGURATION_ROOT
su wopl_test bash -lc $CONFIGURATION_ROOT/wopl_test/bin/buildfrontend.sh