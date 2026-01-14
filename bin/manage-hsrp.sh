#!/usr/bin/env bash

if [[ ! -d helliot_srp ]]; then
  echo "Should run from parent of helliot_srp"
  exit 2
fi

# use runuser instead of su since it is a homeless user.
runuser helliot_srp_service -s /bin/bash -- helliot_srp/bin/manage.sh "$@"