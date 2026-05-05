#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

container_name="mongodb"

source ../.env
CONN_STR=mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@localhost:27017/
BASH_ENV=.env docker exec -it $container_name mongosh $CONN_STR
