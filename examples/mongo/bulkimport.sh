#!/usr/bin/env bash

# Author: J.A.Boogaard@hr.nl

shopt -s globstar

argument_values=("$@")
nr_of_arguments=${#argument_values[@]}

if [ $nr_of_arguments -lt 1 ]
then
    printf "USAGE: %s [json_path]\n" "$0"
    exit
else
    json_path="$1"
fi

path2env=$(realpath .env)
path2import=$(realpath ./import_json.sh)

function import_json() {
    json_file=$(realpath "$1")
    cmd="BASH_ENV=$path2env $path2import $json_file"
    echo $cmd
    eval $cmd

}

( cd $json_path; json_files=( **/*.json ); for json_file in ${json_files[@]}; do import_json $json_file; done )