#!/usr/bin/env bash

if [[ ! -d helliot_srp ]]; then
  echo "Should run from parent of helliot_srp"
  exit 2
fi

runuser helliot_srp_service -s /bin/bash -- helliot_srp/bin/manage.sh "$@"