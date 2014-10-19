FROM ubuntu:14.04
MAINTAINER Tim Haak <tim@haak.co.uk>

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes  python git-core
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer


VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]
