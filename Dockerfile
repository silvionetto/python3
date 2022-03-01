from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

# Install using apt-get
RUN \
	apt-get update \
	&& apt-get -y install wget curl vim git build-essential \
	zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev \
	libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
	
# Install Python3
RUN \
	curl -o /opt/Python.tar.gz https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz \
	&& tar xvzf /opt/Python.tar.gz -C /opt/ \
	&& rm /opt/Python.tar.gz \
	&& cd /opt/Python-3.9.1/ \
	&& ./configure --enable-optimizations \
	&& make -j6 \
	&& make install \
	&& ln -s /usr/local/bin/python3 /usr/local/bin/python

RUN \
	python -m pip --upgrade pip