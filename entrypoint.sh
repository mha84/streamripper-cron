#!/bin/bash

echo "$CRON1 root /ripstream.sh" >> /etc/crontab
/etc/init.d/cron start
tail -f /dev/null