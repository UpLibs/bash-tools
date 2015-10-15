#!/bin/bash +x

#,/upp_partFormating.sh "sdb1" "1"

    fdisk /dev/"$1" >> /dev/null 2>&1
    fdisk /dev/"$1" >> /dev/null 2>&1
    mkfs.ext4 -F /dev/"$1""$2" >> /dev/null 2>&1
    ./upp-checking-cmd.sh "$?"

    ./upp-sync.sh