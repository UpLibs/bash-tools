#!/bin/bash

CANRUN=` /uppoints/scripts/is-time-since-boot-ok.sh 60 `

if [ "${CANRUN}" != "ok" ]
then
  exit
fi

echo "----------------------------------------"

date

######################

WLAN=` /uppoints/scripts/get-wlan-name.sh `

echo "WLAN: ${WLAN}"

######################

WLANIP=` /uppoints/scripts/get-device-ip.sh ${WLAN} `

if [ "${WLANIP}" = "" ]
then
    echo "${WLAN} without IP. Scanning WiFi..."
else
    echo "${WLAN} already got an IP: ${WLANIP}"
    echo "Testing router..."

    for TESTI in 1 2 3 4 5 6 7 8 9 10
    do

      ROUTEROK=` /uppoints/scripts/test-router.sh `

      if [ "${ROUTEROK}" == "ok" ]
      then
         echo "Router OK"
         exit 1
      else
         echo "Router not responding. Refreshing WiFi... [${TESTI}]"
      fi
    
    done
fi

######################


eval WIFILIST=$( /sbin/iwlist ${WLAN} scan 2>/dev/null | awk -F":" '/ESSID/{print $2}')

WIFIOK=0

for wifi in "${WIFILIST[@]}"
do

  if [[ $wifi == UPP-* ]] && [[ WIFIOK -ne 1 ]]
  then

     part=( $(echo $wifi | tr "-" "\n") )

     pass="uppupp${part[1]}"

     echo "Selecting WiFi \"${wifi}\" pass: \"${pass}\""

     WIFICONN=` /uppoints/scripts/set-wifi.sh ${WLAN} "${wifi}" "${pass}" | grep "WiFi connection OK" `

     if [ "${WIFICONN}" != "" ]
     then

        INTERNETOK=` /uppoints/scripts/is-wlan-ok.sh `

        if [ "${INTERNETOK}" == "ok" ]
	then
          echo "WiFi connection OK."
          WIFIOK=1
        fi

     fi

  fi

done

exit 0
