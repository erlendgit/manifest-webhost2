#!/usr/bin/env bash

cd $WOPL_TEST_PROJECT_ROOT

cd frontend
npm install
npm run build

cd $WOPL_TEST_PROJECT_ROOT

rm -rf venv
python 3.13 -m venv venv
source venv/bin/activate
pip install -r backend2/requirements.prod.txt

