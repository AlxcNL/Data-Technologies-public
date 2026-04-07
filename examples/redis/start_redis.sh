#!/usr/bin/env bash

# https://redis.io/tutorials/howtos/quick-start/

version="trixie"
host_port1=6379
host_port2=8001
container_name="redis"

docker run -it --rm --name ${container_name} -p ${host_port1}:6379 -p ${host_port2}:8001 redis:${version}
