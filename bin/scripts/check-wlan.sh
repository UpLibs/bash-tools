#!/bin/sh

WLAN=$1

WLANIP=`ifconfig ${WLAN} | sed 's/.*inet addr:\([0-9\.]*\).*/\1/' | sed -n 2p `

if [ "${WLANIP:-null}" = null ]; then
    echo "WLAN without IP."
else
    echo "WLAN already got an IP: ${WLANIP}"
    exit 1
fi



