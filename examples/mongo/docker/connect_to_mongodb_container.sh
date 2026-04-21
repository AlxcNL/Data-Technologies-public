#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

container_name="mongodb"

BASH_ENV=.env docker exec -it $container_name mongosh $CONN_STR

