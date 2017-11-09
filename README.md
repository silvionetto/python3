[![](https://images.microbadger.com/badges/image/silvionetto/python3.svg)](https://microbadger.com/images/silvionetto/python3 "Get your own image badge on microbadger.com")

# python

## Build
docker build -t silvionetto/python3 .



## Run
docker run -it --name python3 silvionetto/python3 bash



## Start
systemctl start docker

## Stop
systemctl stop docker

## Restart
systemctl restart docker

## Crete a systemd direcotry
mkdir -p /etc/systemd/system/docker.service.d

## Create http-proxy.conf file
touch /etc/systemd/system/docker.service.d/http-proxy.conf

## Add the content to the file
[Service]
Environment="HTTP_PROXY=http://proxy.example.com:80/"

## Create https-proxy.conf file
touch /etc/systemd/system/docker.service.d/https-proxy.conf

## Create https-proxy.conf file
[Service]
Environment="HTTPS_PROXY=http://proxy.example.com:80/"

## Flush Changes
systemctl daemon-reload

## Restart Docker
systemctl restart docker