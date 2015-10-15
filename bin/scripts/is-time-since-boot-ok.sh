#!/bin/bash

TIMESINCEBOOT=` /uppoints/scripts/get-time-since-boot.sh `

if [ $TIMESINCEBOOT -gt $1 ]
then
  echo "ok"
fi

