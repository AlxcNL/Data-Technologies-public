#!/usr/bin/env bash

image="neo4j:5"
password=secret
containername="neo4j"
host_port=7474

docker run -d --name $containername -e NEO4J_AUTH=neo4j/$password -p $host_port:7474 -p 7687:7687 $image
