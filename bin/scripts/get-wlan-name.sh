#!/bin/sh

eval WLANLIST=( $( /sbin/ifconfig | grep UP | tr -s ' ' | cut -d' ' -f 1 | grep wlan | sed 's/://' ) )

WLAN=${WLANLIST[0]}

if [ "${WLAN:-null}" = null ]; then
    exit 1
else
    echo "${WLAN}"
    exit 0
fi


