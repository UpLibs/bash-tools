#!/bin/bash -x

#./upp-format-sdcard.sh "sdb" "1"

./upp-umount-devices.sh "$1" "$2"

dd if=/dev/zero of="/dev/$1" bs=1M count=16 >> /dev/null 2>&1
./upp-checking-cmd.sh "$?"

./upp-part-formating.sh "$1" "$2"

./upp-mount-devices.sh "$1" "$2"

