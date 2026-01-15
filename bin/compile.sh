#!/usr/bin/env bash

export ENVSUBST=$CONFIGURATION_ROOT/bin/envsubst.py

compile_configuration_files() {
  mkdir -p compiled
  find . -name '*.template' -exec sh -c '$ENVSUBST < "$0" > "compiled/${0%.template}"' {} \;
}

cd $CONFIGURATION_ROOT/wopl_test/etc
compile_configuration_files

cd $CONFIGURATION_ROOT/helliot_srp/etc
compile_configuration_files

systemctl daemon-reload
