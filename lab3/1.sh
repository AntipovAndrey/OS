#!/bin/bash
data="$(ps -u "$(whoami)" -o '%p:%a' h)"
echo "$data" > andreyPid.comm
echo "$data" | wc -l
