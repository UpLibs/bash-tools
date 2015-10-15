#!/bin/bash

FREESPACE=` /uppoints/scripts/get-free-hd-space.sh  `

if [ $FREESPACE -ge $1 ]
then
  echo "ok"
else
  echo "No fress space: ${FREESPACE} < $1"
fi

