#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

docker-compose -f mongodb_and_mongosh.yaml down
docker-compose -f mongodb_and_mongosh.yaml up
