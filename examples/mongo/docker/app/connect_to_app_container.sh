#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

# TODO Install mongo shell
# https://www.baeldung.com/linux/mongodb-alpine-installation

container_name="app"
mongo_host="mongodb"

source ../.env
CONN_STR=mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@${mongo_host}:27017/
BASH_ENV=.env docker exec -it $container_name mongo $CONN_STR

# docker exec -it $container_name bash
