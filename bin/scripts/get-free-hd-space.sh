#!/bin/bash

FREESPACE=` df  / | grep "% /" | tr -s ' ' | cut -d' ' -f 4 `  

echo  $FREESPACE


