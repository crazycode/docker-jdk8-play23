#!/bin/sh
docker run -e "HOST_UID=`id -u`" -e "HOST_USER=$USER" --link postgres:postgres -p 9001:9000 -v $HOME:/var/home:rw -i -t $* crazycode/ubuntu-jdk8-play23
