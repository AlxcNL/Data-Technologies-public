#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

shopt -s globstar

argument_values=("$@")
nr_of_arguments=${#argument_values[@]}

if [ $nr_of_arguments -lt 1 ]
then
    printf "USAGE: %s [mongodb host] [json_path]\n" "$0"
    exit
else
    host="$1"
    json_path="$2"
fi

path2import=$(realpath ./import_json.sh)

function import_json() {
    json_file=$(realpath "$1")
    cmd="$path2import $host $json_file"
    echo $cmd
    eval $cmd

}

( cd $json_path; json_files=( **/*.json ); for json_file in ${json_files[@]}; do import_json $json_file; done )