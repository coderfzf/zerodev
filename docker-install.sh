#!/bin/bash

curl -fsSL https://get.docker.com | bash -s docker --mirror aliyun

curl -L https://get.daocloud.io/docker/compose/releases/download/v2.6.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

docker-compose -v