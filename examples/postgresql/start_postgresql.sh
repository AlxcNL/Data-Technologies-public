#!/usr/bin/env bash

mkdir -p pgadmin-data
./stop_postgresql.sh || echo "Ya plus de Postgresql containers"
docker-compose -f postgresql.yml up