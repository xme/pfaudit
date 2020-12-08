FROM ubuntu:20.04
MAINTAINER Xavier Mertens <xavier@rootshell.be>
VOLUME /data
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip cron
COPY requirements.txt /
COPY pfaudit.py /
COPY entrypoint.sh /
RUN chmod a+x /pfaudit.py /entrypoint.sh
RUN pip3 install -r /requirements.txt
RUN touch /.firstboot
ENTRYPOINT ["/entrypoint.sh"]
