#!/bin/bash

#./upp-umount-devices.sh sdb 1

    ./upp-sync.sh
    umount /dev/$1$2 >> /dev/null 2>&1

