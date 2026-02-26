#!/bin/env bash
# Author: J.A.Boogaard@hr.nl

dir="../bin"
java -cp "$dir/h2-2.4.240.jar:$H2DRIVERS:$CLASSPATH" org.h2.tools.Shell