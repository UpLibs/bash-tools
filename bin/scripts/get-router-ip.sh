#!/bin/bash +x

eval ROUTERIPLIST=$( /sbin/ip r | grep default | cut -d ' ' -f 3 )

ROUTERIP=${ROUTERIPLIST[0]}

if [ "${ROUTERIP:-null}" = null ]; then
    exit 1
else
    echo "${ROUTERIP}"
    exit 0
fi

