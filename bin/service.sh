#!/usr/bin/env bash

if [[ ! -f .env ]]; then
  echo "Error: .env file not found. Please create a .env file with the necessary environment variables."
  exit 2
fi

set -o allexport
source .env
set +o allexport

service "$@"