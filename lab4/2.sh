#!/bin/bash

at -f 1.sh now + 1 minute >/dev/null 2>&1
tail -f ~/report -n 0
