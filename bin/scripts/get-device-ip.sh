#!/bin/bash

WLAN=$1

WLANIP=`/sbin/ifconfig ${WLAN} | sed 's/.*inet \([0-9\.]*\).*/\1/' | sed -n 2p | awk '$1 ~ /^[0-9\.]+$/' `

if [ "${WLANIP:-null}" = null ]; then
    exit 1
else
    echo "${WLANIP}"
    exit 0
fi
