#!/bin/sh

PARTEND=` /uppoints/scripts/get-partitions-free-space.sh `

if [ $PARTEND -le 20 ]
then
  echo "** Partition already at maximum size!"
  exit
fi

parted /dev/mmcblk0 resizepart 1 $PARTEND

resize2fs /dev/mmcblk0p1

reboot
