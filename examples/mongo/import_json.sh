#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

argument_values=("$@")
nr_of_arguments=${#argument_values[@]}

if [ $nr_of_arguments -lt 1 ]
then
    printf "USAGE: %s [json_file]\n" "$0"
    exit
else
    json_file="$1"
fi

database="lyrics"
collection="songs"
source $BASH_ENV

cmd="mongoimport ${CONN_STR}/${database} --authenticationDatabase admin --collection $collection $json_file"
echo $cmd
eval $cmd
