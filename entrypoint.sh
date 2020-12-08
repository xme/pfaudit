#!/bin/bash
if [ -r /.firstboot ]; then
    echo "*/10 * * * * /pfaudit.py -H $PFAUDIT_HOST -u $PFAUDIT_USER -k $PFAUDIT_SSHKEY -v -j -l $PFAUDIT_LOGFILE >/data/pfaudit.log 2>&1\n\n" >/etc/cron.d/pfaudit-cron
    chmod 0644 /etc/cron.d/pfaudit-cron
    crontab /etc/cron.d/pfaudit-cron
    touch /var/log/cron.log
    rm /.firstboot
fi
cron && tail -f /var/log/cron.log
