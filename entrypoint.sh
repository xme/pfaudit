#!/bin/bash
if [ -r /.firstboot ]; then
    cat <<__CRON__ >/etc/cron.d/pfaudit-cron
*/10 * * * * /pfaudit.py -H $PFAUDIT_HOST -u $PFAUDIT_USER -k $PFAUDIT_SSHKEY -v -j -l $PFAUDIT_LOGFILE >>/data/pfaudit.log 2>&1

__CRON__
    chmod 0644 /etc/cron.d/pfaudit-cron
    crontab /etc/cron.d/pfaudit-cron
    touch /var/log/cron.log
    rm /.firstboot
fi
cron && tail -f /var/log/cron.log
