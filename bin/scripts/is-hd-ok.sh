#!/bin/bash

HDOK=` ls -al /var/run/reserve-hd.space 2>/dev/null | tr -s ' ' | cut -d' ' -f 5  `

if [ "${HDOK}" != "" ] && [ $HDOK -ge 1000 ];
then
  echo "ok"
else
  echo "HD not OK! No reserved space at boot: /var/run/reserve-hd.space "
fi

