#!/usr/bin/env python3

import os
import sys

for line in sys.stdin:
    sys.stdout.write(
        os.path.expandvars(line)
    )