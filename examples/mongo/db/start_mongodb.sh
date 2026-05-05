#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

compose_file="mongodb_and_app.yaml"

docker-compose -f $compose_file down
docker-compose -f $compose_file up mongodb
