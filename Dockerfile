# kiwiIRC
# Version 0.1

FROM yrpri/base
MAINTAINER Robert Vidar Bjarnason <robert@citizens.is>

RUN echo 'version 0.15'

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update
RUN apt-get -yqq upgrade
RUN apt-get install -y python-software-properties software-properties-common python
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -yqq install openssl git nodejs

RUN mkdir -p /root/KiwiIRC/
ADD KiwiIRC/ /root/KiwiIRC/

ADD supervisor.conf /etc/supervisor/conf.d/kiwiirc.conf

VOLUME ["/etc/kiwiirc"]

EXPOSE 443

CMD ["/usr/bin/supervisord"]
