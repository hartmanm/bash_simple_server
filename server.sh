#!/bin/bash

# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

COUNTER=0
while [[ 1 ]] | nc -l "${1:-8080}";
do
COUNTER=$((COUNTER+1))
bash connector $COUNTER $2 & 
while ! [[ -e "$PWD"/cmd_complete ]]
do
sleep 1
done
sleep 2
rm "$PWD"/cmd_complete
> "$PWD"/screenlog.0
done ##  while [[ 1 ]] | nc -l "${1:-8080}"; 
