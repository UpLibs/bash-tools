#!/bin/bash

#./upp-download-extract.sh "https://s3.amazonaws.com/uppoints-public/jdk-8u33-linux-arm-vfp-hflt.gz" "teste" "/tmp/"

    ./upp-download.sh $1 $2
    echo "bsdtar -xpf $2 -C $3"

    bsdtar -xpf "$2" -C "$3"
    ./upp-checking-cmd.sh "$?"

    rm -rf $2
    ./upp-sync.sh
