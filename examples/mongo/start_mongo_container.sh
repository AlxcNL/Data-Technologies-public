#!/usr/bin/env bash

docker run -it --name mongod -v ./data:/data/db -d mongo
