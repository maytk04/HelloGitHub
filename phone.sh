#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: phone searchfor [...searchfor]"
    echo "(You didn't tell me what you want to search for.)"
    exit 1
fi

RESULT=$(egrep "$*" "mydata")

if [ -z "$RESULT" ]; then
    exit 0
fi

echo "$RESULT" | awk -F '|' '
{
    print "--------------->"
    print "Name: "$1;
    print "Address: "$2;
