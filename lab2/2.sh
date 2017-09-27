#!/bin/bash
data="$(cat /var/log/Xorg.0.log | grep -E '^\[.*\]\ \([WI]{2}' | sort -k3 | sed 's/(WW)/Warning:/' | sed 's/(II)/Information:/')"
echo "$data" > full.log
echo "$data"

