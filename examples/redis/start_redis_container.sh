#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

version="trixie"
image="redis:${version}"
host_port1=6379
container_port1=6379
host_port2=8001
container_port2=8001
container_name="redis"

docker run -it --rm --name ${container_name} -p $host_port1:$container_port1 -p $host_port2:$container_port2 $image
