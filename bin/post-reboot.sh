#!/usr/bin/env bash

service helliot_srp_web restart
service helliot_srp_worker restart

service wopl-test-backend restart
service wopl-test-worker restart