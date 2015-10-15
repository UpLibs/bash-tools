#!/bin/bash

    mount /dev/$1$2 $3 >> /dev/null 2>&1
    mountpoint -q $3
    ./upp-checking-cmd.sh "$?"