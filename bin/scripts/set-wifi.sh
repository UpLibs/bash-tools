#!/bin/sh

if [ $# -lt 1 ]
then
    read -p "WLAN: " WLAN
else
    WLAN=$1
fi

if [ "${WLAN}" = "" ]
then
    echo "Invalid WLAN."
    exit
fi


if [ $# -lt 2 ]
then
    read -p "SSID: " SSID
else
    SSID=$2
fi

if [ "${SSID}" = "" ]
then
    echo "Invalid SSID."
    exit
fi

if [ $# -lt 3 ]
then
    read -p "PSK: " PSK
else
    PSK=$3
fi

if [ "${PSK}" = "" ]
then
    echo "Invalid PSK."
    exit
fi


SSID="\"${SSID}\""
PSK="\"${PSK}\""

echo "Setting up WiFi [${WLAN}] Network: ${SSID}"

NW=` /sbin/wpa_cli -i ${WLAN} add_network`

echo "Network index: ${NW}"

RET=` /sbin/wpa_cli -i ${WLAN} set_network ${NW} key_mgmt WPA-PSK `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi

RET=` /sbin/wpa_cli -i ${WLAN} set_network ${NW} psk "${PSK}" `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi


RET=` /sbin/wpa_cli -i ${WLAN} set_network ${NW} ssid "${SSID}" `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi

RET=` /sbin/wpa_cli -i ${WLAN} select_network ${NW} `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi

RET=` /sbin/wpa_cli -i ${WLAN} enable_network ${NW} `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi

RET=` /sbin/wpa_cli -i ${WLAN} reassociate `

if [ "${RET}" != "OK" ]
then
  echo "error"
  exit 1
fi

echo "Connecting to WiFi... [10s]"

sleep 10

/sbin/wpa_cli -i ${WLAN} status

echo "Renewing IP address..."

##/sbin/dhclient ${WLAN}

/usr/bin/dhcpcd -k ${WLAN}
sleep 2
/usr/bin/dhcpcd ${WLAN}

WLANIP=` /uppoints/scripts/get-device-ip.sh ${WLAN} `

if [ "${WLANIP}" = "" ]
then
  echo "error getting IP"
  exit 1
else
  echo "WiFi connection OK: ${WLANIP}"
fi







