FROM ubuntu:trusty
MAINTAINER Tim Haak <tim@haak.co.uk>

RUN apt-get -q update
RUN apt-get -qy --force-yes dist-upgrade

RUN apt-get install -qy --force-yes  python git-core software-properties-common python-pip build-essential python-dev libffi-dev libssl-dev
RUN pip install --upgrade cryptography pyopenssl ndg-httpsclient pyasn1

RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer


VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

RUN apt-get autoremove &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

CMD ["/start.sh"]
