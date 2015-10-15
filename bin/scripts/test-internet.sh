#!/bin/bash

PACKETLOSS=` /bin/ping -q -w 10 -c 10 www.google.com 2>&1 | grep "packet loss" | sed 's/.*received, \([0-9\.]*\).*/\1/' | awk '$1 ~ /^[0-9\.]+$/' `

if [[ $PACKETLOSS -eq 100 ]] || [[ $PACKETLOSS == "" ]]
then
  echo "error"
else
  echo "ok"
fi




