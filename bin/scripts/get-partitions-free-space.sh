#!/bin/sh

eval FREELIST=( $( parted /dev/mmcblk0 unit MB print free | grep "Free Space" | tr -s " " | sed 's/\s[0-9\.]*MB\s*\([0-9\.]*\).*/\1/' ) )

FREEEND=${FREELIST[-1]}

echo $FREEEND



