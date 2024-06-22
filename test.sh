#!/bin/bash
if [ "$#" -eq 1 ] && [ -f $1 ]; then
    echo "[TEST PASS]"
    exit 0
else
    echo "[TEST FAIL]"
    exit 84
fi
