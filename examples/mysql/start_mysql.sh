#!/usr/bin/env bash

mkdir -p mysql_data

docker-compose -f mysql.yaml down --remove-orphans
docker-compose -f mysql.yaml up -d

