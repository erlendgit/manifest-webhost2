#!/usr/bin/env bash

if [[ ! -d wopl_test ]]; then
  echo "Should run from parent of wopl_test"
  exit 2
fi

su wopl_test -- wopl_test/bin/manage.sh "$@"