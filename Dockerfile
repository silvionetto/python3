from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

# Install using apt-get
RUN \
	apt-get update \
	&& apt-get -y install wget curl vim git default-jre default-jdk build-essential \
	zlib1g-dev python3-pip libssl-dev
	
# Install Python3
RUN \
	curl -o /opt/Python.tar.gz https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz \
	&& tar xvzf /opt/Python.tar.gz -C /opt/ \
	&& rm /opt/Python.tar.gz \
	&& cd /opt/Python-3.6.3/ \
	&& ./configure --enable-optimizations \
	&& make -j8 \
	&& make altinstall \
	&& ln -s /usr/local/bin/python3 /usr/local/bin/python
	
# Install Heroku	
RUN \
	wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
	
# Install SlackClient
RUN \
	pip3 install slackclient