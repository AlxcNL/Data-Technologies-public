#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

version="trixie"
host_port1=6379
host_port2=8001
container_name="redis"

docker run -it --rm --name ${container_name} -p ${host_port1}:6379 -p ${host_port2}:8001 redis:${version}
