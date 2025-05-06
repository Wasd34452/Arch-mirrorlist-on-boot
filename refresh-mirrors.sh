#!/bin/bash

LOGFILE="/var/log/refresh-mirrors.log"
{
    echo "[Reflector Run: $(date)]"
    /usr/bin/reflector --country 'United States' --age 12 --protocol https --sort rate --latest 10 --verbose --save /etc/pacman.d/mirrorlist
    echo "----"
} >> "$LOGFILE" 2>&1
