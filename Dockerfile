FROM ubuntu:20.04
MAINTAINER Xavier Mertens <xavier@rootshell.be>
VOLUME /data
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip cron
COPY requirements.txt /
COPY pfaudit.py /
RUN chmod a+x /pfaudit.py
RUN pip3 install -r /requirements.txt
RUN echo "*/10 * * * * /pfaudit.py -H $PFAUDIT_HOST -u $PFAUDIT_USER -k $PFAUDIT_SSHKEY -v -j -l PFAUDIT_LOGFILE >/data/pfaudit.log 2>&1\n\n" >/etc/cron.d/pfaudit-cron
RUN chmod 0644 /etc/cron.d/pfaudit-cron
RUN crontab /etc/cron.d/pfaudit-cron
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log
