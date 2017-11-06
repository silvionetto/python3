from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

RUN \
	apt-get update \
	&& apt-get -y install curl vim git default-jre default-jdk build-essential zlib1g-dev
	
RUN \
	curl -o /opt/Python.tar.gz https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz \
	&& tar xvzf /opt/Python.tar.gz -C /opt/ \
	&& rm /opt/Python.tar.gz \
	&& cd /opt/Python-3.6.3/ \
	&& ./configure \
	&& make \
	&& make install 