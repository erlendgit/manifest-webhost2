#!/usr/bin/env bash

compile_configuration_files() {
  mkdir -p compiled
  find . -name '*.template' -exec sh -c 'envsubst < "$0" > "compiled/${0%.template}"' {} \;
}

cd $CONFIGURATION_ROOT/wopl_test/etc
compile_configuration_files
