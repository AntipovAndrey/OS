#!/bin/bash
ps -e -o '%p:%a' | grep -E '^\ *[0-9]+:/sbin/' | grep -oP '^\ *[0-9]+' | tr -d ' ' > fromSbin.pid
