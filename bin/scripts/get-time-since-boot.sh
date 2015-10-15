#!/bin/bash

TIMESINCE=` cat /proc/uptime | cut -d " " -f 1 | cut -d "." -f 1 `  

echo  $TIMESINCE


