#!/usr/bin/env bash

mkdir -p mysql_data
docker run --rm -p 3306:3306 -v $PWD/mysql_data:/var/lib/mysql -v $PWD/sakila:/tmp/sakila --env-file .env --name mysql_container mysql:latest