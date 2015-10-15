#!/bin/bash

if [ "${UPPCAMID:-null}" = null ]; then
    exit
fi


if [ "${UPPCAMID}" != "undef" ] && [ "${UPPCAMID}" != "dummy.undef" ]
then
  echo "ok"
fi
