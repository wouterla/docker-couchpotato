FROM hypriot/rpi-alpine-scratch:latest
MAINTAINER Wouter Lagerweij <wouter@lagerweij.com>

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN apk -U upgrade && \
    apk -U add \
        ca-certificates git \
        py-pip ca-certificates git python py-libxml2 libxml2-dev libxslt-dev \
        make gcc g++ python-dev openssl-dev libffi-dev \
    && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install --upgrade setuptools && \
    pip --no-cache-dir install --upgrade pyopenssl  && \
    pip --no-cache-dir install --upgrade lxml && \
    git clone --depth 1 https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer && \
    apk del make gcc g++ python-dev && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

VOLUME ["/config", "/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

CMD ["/start.sh"]
