#!/bin/sh


find /boot -type f -exec md5sum {} \;
find /etc -type f -exec md5sum {} \;
find /home -type f -exec md5sum {} \;
find /usr -type f -exec md5sum {} \;
find /root -type f -exec md5sum {} \;
find /var -type f -exec md5sum {} \;




