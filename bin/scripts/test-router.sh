#!/bin/bash

ROUTERIP=` /uppoints/scripts/get-router-ip.sh `

## echo ${ROUTERIP}

PACKETLOSS=` /bin/ping -q -w 10 -c 10 "${ROUTERIP}" 2>&1 | grep "packet loss" | sed 's/.*received, \([0-9\.]*\).*/\1/' | awk '$1 ~ /^[0-9\.]+$/' `

if [[ $PACKETLOSS -eq 100 ]] || [[ $PACKETLOSS == "" ]]
then
  echo "error"
else
  echo "ok"
fi




