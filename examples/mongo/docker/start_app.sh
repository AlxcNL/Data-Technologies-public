#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

compose_file="mongodb_and_app.yaml"
containername="app"

docker-compose -f $compose_file down \
&& docker container rm -f $containername
docker-compose -f $compose_file up $containername
