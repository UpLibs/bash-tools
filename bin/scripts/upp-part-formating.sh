#!/bin/bash +x

#,/upp_partFormating.sh "sdb" "1"

    echo -e "\nd\nw" | fdisk /dev/$1 >> /dev/null 2>&1
    echo -e "\nn\np\n1\n\n\nw" | fdisk /dev/$1 >> /dev/null 2>&1
    mkfs.ext4 -F /dev/$1$2 >> /dev/null 2>&1

    ./upp-checking-cmd.sh "$?"

    ./upp-sync.sh