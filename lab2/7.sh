#!/bin/bash
man bash | tr ' .;:[]()"' '\n' | sort | uniq -c | sort -nr | grep -E '[^\ ][a-zA-Z]{4}$' | head -n3 | awk '{ print $NF }'
