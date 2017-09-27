#!/bin/bash
cd /bin
cat $(ls -l | grep '^[^d]r.x' | awk '{ print($NF) }') | grep -a '^#!' | uniq -c | sort -nr | head -n1 | awk '{ print $NF }' | cut -d ! -f2
