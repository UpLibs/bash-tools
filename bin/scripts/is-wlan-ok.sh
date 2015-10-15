#!/bin/bash

CANRUN=` /uppoints/scripts/is-time-since-boot-ok.sh 80 `

if [ "${CANRUN}" != "ok" ]
then
  exit 1
fi

######################

WLAN=` /uppoints/scripts/get-wlan-name.sh `

WLANIP=` /uppoints/scripts/get-device-ip.sh ${WLAN} `

if [ "${WLANIP}" = "" ]
then
    exit
else

    for TESTI in 1 2 3 4 5 6 7 8 9 10
    do

      ROUTEROK=` /uppoints/scripts/test-router.sh `

      if [ "${ROUTEROK}" == "ok" ]
      then
         echo "ok"
         exit 0
      fi
    
    done
fi

######################

exit 1
