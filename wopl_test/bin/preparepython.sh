#!/usr/bin/env bash

# Exit on error
set -e

echo "\n\n===\nStarted at $(date)\n===\n"
source /etc/environment

if [[ $(whoami) != $WOPL_TEST_PROJECT_USER ]]; then
  echo "Should run as $WOPL_TEST_PROJECT_USER"
  exit 2
fi

cd $WOPL_TEST_HOME

mkdir -p api_static
mkdir -p api_uploads

rm -rf venv
if [[ ! -d venv ]]; then
  python3.13 -m venv venv
fi

source venv/bin/activate
pip install -r project/env/backend/requirements.prod.txt
