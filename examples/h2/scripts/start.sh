#!/bin/env bash

dir="../bin"
java -cp "$dir/h2-2.4.240.jar:$H2DRIVERS:$CLASSPATH" org.h2.tools.Console "$@"
