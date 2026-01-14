#!/usr/bin/env bash

if [[ $(whoami) != $HSRP_PROJECT_USER ]]; then
  echo "Should run as $HSRP_PROJECT_USER"
  exit 2
fi

cd $HSRP_HOME

if [[ -d venv ]]; then
  rm -rf venv
fi

python3.13 -m venv venv
source venv/bin/activate

cd project

pip install --upgrade pip
pip install -r requirements.txt

npm install
export PATH=$(pwd)/node_modules/.bin/:$PATH
npm run build

set -o allexport
source .env
set +o allexport

cd src

python manage.py collectstatic --noinput
