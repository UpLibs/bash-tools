#!/bin/bash

#./upp-mount-devices.sh "sdb" "1"
    mount /dev/$1$2  >> /dev/null 2>&1
    ./upp-checking-cmd.sh "$?"