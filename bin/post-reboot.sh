#!/usr/bin/env bash

# Na het booten komen python services niet goed up. Misschien een timing dingetje.

service helliot_srp_web restart
service helliot_srp_worker restart

service wopl-test-backend restart
service wopl-test-worker restart