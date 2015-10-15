#!/bin/bash

    ./upp-download.sh $1 $2
    echo "bsdtar -xpf $2 -C $3"

    bsdtar -xpf "$2" -C "$3"
    ./upp-checking-cmd.sh "$?"

    ./upp-sync.sh
