#!/bin/bash -x

devname=$1
partition="1"
devMountPoint="/mnt/build-upp-linux"

./upp-umount-devices.sh $devname $partition
umount "/dev/${devname}{0..9}" >> /dev/null 2>&1

dd if=/dev/zero of="/dev/$devname" bs=1M count=16 >> /dev/null 2>&1
./upp-checking-cmd.sh "$?"

./upp-part-formating.sh $devname $partition

./upp-mount-devices.sh $devname $partition

./upp_sync.sh