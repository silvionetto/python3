from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

# Install using apt-get
RUN \
	apt-get update \
	&& apt-get -y install wget curl vim git default-jre default-jdk build-essential \
	zlib1g-dev python3-pip libssl-dev
	
# Install Python3
RUN \
	curl -o /opt/Python.tar.gz https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz \
	&& tar xvzf /opt/Python.tar.gz -C /opt/ \
	&& rm /opt/Python.tar.gz \
	&& cd /opt/Python-3.10.2/ \
	&& ./configure --enable-optimizations \
	&& make -j8 \
	&& make altinstall \
	&& ln -s /usr/local/bin/python3 /usr/local/bin/python