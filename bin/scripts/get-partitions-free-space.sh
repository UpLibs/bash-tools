#!/bin/sh

eval FREELIST= $( parted /dev/"$1" unit MB print free | grep "Free Space" | tr -s " " | sed 's/\s[0-9\.]*MB\s*\([0-9\.]*\).*/\1/' )

FREEEND=${FREELIST[-1]}

echo $FREEEND



