#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

image="app:0.1"

# docker rmi $image
docker build -t $image .