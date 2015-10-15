#!/bin/bash

    wget -O "$2" "$1" 2>&1
    stdbuf -o0 awk '/[.] +[0-9][0-9]?[0-9]?%/ { print substr($0,63,3) }'
    ./upp-checking-cmd.sh "$?"
    ./upp-sync.sh
