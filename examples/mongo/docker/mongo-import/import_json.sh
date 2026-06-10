#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

argument_values=("$@")
nr_of_arguments=${#argument_values[@]}

if [ $nr_of_arguments -lt 2 ]
then
    printf "USAGE: %s [mongodb host] [json_file]\n" "$0"
    exit
else
    host="$1"
    json_file="$2"
fi

database="lyrics"
collection="songs"
CONN_STR="mongodb://${host}"

cmd="mongoimport ${CONN_STR}/${database} --collection $collection $json_file"
echo $cmd
eval $cmd
