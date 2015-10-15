#!/bin/sh

strings /dev/mmcblk0 | head -n 10000 | grep U-Boot | grep "Arch Linux"


