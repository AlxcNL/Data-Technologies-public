#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

container_name="mongosh"

CONN_STR=mongodb://root:password@mongodb:27017
docker exec -it $container_name mongosh $CONN_STR
