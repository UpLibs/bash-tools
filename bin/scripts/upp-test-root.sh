#!/usr/bin/env bash

 if [ "$UID" -ne 0 ]; then
    echo "User is not root!"
    exit 0
 fi
