#!/bin/bash
if [ $# -ne 1 ]
then
    echo "$0 < listener port"
    exit
fi

nc -l $1
