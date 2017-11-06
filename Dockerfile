from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

RUN \
	apt-get update \
	&& apt-get -y install vim maven python-pip git default-jre default-jdk \
    && pip install pip --upgrade \
	&& pip install ansible