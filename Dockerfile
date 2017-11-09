from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

ARG corp_key
ARG password

#Install using apt-get
RUN \
	apt-get update \
	&& apt-get -y install wget curl vim git default-jre default-jdk build-essential \
	zlib1g-dev python3-pip libssl-dev
	
#Install Python3
RUN \
	curl -o /opt/Python.tar.gz https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz \
	&& tar xvzf /opt/Python.tar.gz -C /opt/ \
	&& rm /opt/Python.tar.gz \
	&& cd /opt/Python-3.6.3/ \
	&& ./configure --enable-optimizations \
	&& make -j8 \
	&& make altinstall \
	&& ln -s /usr/local/bin/python3 /usr/local/bin/python
	
#Install Heroku	
RUN \
	wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
	
#Install Pip
RUN \
	curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
	&& ln -s /usr/local/bin/pip3 /usr/local/bin/pip \
	&& pip install pip --upgrade \
	&& pip install slackclient \
	&& pip install -r requirements.txt --proxy="http://${corp_key}:${password}@proxynlwp.europe.intranet:8080" slackclient