from ubuntu:xenial

MAINTAINER Silvio Netto <silvio.netto@gmail.com>

# Install using apt-get
RUN \
	apt-get update \
	&& apt-get -y install wget curl vim