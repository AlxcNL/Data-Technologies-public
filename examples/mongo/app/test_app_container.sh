#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

docker container rm app && docker run --rm --name app -it -p 5000:5000 --entrypoint bash app:0.1