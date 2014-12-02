#!/bin/sh
docker run -e "HOST_UID=`id -u`" -e "HOST_USER=$USER" -p 9001:9000 -v $HOME:$HOME:rw -i -t $* crazycode/ubuntu-jdk8-play23
