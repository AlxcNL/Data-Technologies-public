#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

argument_values=("$@")
nr_of_arguments=${#argument_values[@]}

if [ $nr_of_arguments -lt 2 ]
then
    printf "USAGE: %s [server] [json_file]\n" "$0"
    exit
else
    server="$1"
    json_file="$2"
fi

CONN_STR=mongodb://root:password@${server}:27017
database="lyrics"
collection="songs"

cmd="mongoimport $CONN_STR --authenticationDatabase admin --db $database --collection $collection $json_file"
echo $cmd
eval $cmd