#!/bin/bash

DATEOK=` date +"%Y" `

if [ $DATEOK -ge 2013 ]
then
  echo "ok"
else
  echo "NTPD out of sync"
fi

