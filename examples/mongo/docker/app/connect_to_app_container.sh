#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

# TODO Install mongo shell
# https://www.baeldung.com/linux/mongodb-alpine-installation

container_name="app"
mongo_host="mongodb"

BASH_ENV=../../.env docker exec -it $container_name mongo $CONN_STR

