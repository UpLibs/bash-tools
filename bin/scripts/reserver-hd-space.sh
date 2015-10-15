#!/bin/bash

HDSPACEOK=` /uppoints/scripts/is-hd-space-free.sh 50000 `  

if [ "${HDSPACEOK}" != "ok" ]
then
  rm /var/run/reserve-hd.space
  exit
fi

/bin/dd if=/dev/null of=/var/run/reserve-hd.space bs=1M seek=10

echo "** Reserved HD space: 10M"
