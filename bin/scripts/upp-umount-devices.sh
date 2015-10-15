#!/bin/bash

    ./upp-sync.sh
    umount /dev/$1$2 >> /dev/null 2>&1
    umount $3 >> /dev/null 2>&1
