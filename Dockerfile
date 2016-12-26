FROM ubuntu:16.04
MAINTAINER plumcraft <olivier.lebhard@gmail.com>

ADD . /tmp
RUN /tmp/resources/scripts/setup_sonos_http_api.sh

WORKDIR /root/node-sonos-http-api 
CMD npm start
