#!/bin/bash
pageSize="$(getconf PAGESIZE)"
let pageSize=pageSize/1024
top -b -n1 | tail -n +8 | awk -v pgs=$pageSize '{ printf("%s:%d\n", $1, int( ($5-$6) / pgs ) )  }' | sort -t : -k 2 -nr
