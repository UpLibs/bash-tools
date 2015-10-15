#!/bin/bash

#./upp-download.sh "https://s3.amazonaws.com/uppoints-public/jdk-8u33-linux-arm-vfp-hflt.gz" "teste"

    wget -O "$2" "$1" 2>&1
    ./upp-checking-cmd.sh "$?"
    ./upp-sync.sh
