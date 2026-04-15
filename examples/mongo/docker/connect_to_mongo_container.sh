#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

CONN_STR=mongodb://root:password@mongodb:27017
docker exec -it mongodb_app_1 mongosh mongodb://root:password@mongodb:27017
