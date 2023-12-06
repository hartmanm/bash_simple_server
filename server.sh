#!/bin/bash
COUNTER=0
#[[ -e "$2"/response ]] || touch "$2"/response
#RESPONSE=""
#exec 9>&1
#[[ -e "$2"/pipe ]] || cd "$2"; mkfifo pipe

#while [[ 1 ]] | nc -l "${1:-8080}"; | tee response;
while [[ 1 ]] | nc -l "${1:-8080}";
#while [[ 1 ]] | nc -l "${1:-8080}" 0<pipe & # | bash connector $COUNTER $2 &;
do

#nc -l 12345  0<backpipe | nc www.google.com 80 1>backpipe
#echo $RESPONSE
#echo "hello" | tee tmp_file
#RESPONSE=$(cat response)
#$var=$(echo "hello" | tee /dev/tty)
#exec 10>&1
#var="$(echo "hello" | tee /proc/self/fd/10)"
#hello
#echo "$var"
#hello
#( generator | tee >(processor) )
#generator > in.txt && processor < in.txt > out.txt && cat in.txt out.txt | verifier
#SEND_RESPONSE=$(cat "$2"/response)
COUNTER=$((COUNTER+1))
#bash connector $COUNTER $2 $RESPONSE & 
bash connector $COUNTER $2 & 
#SIZE=$(wc -c <"$PWD"/screenlog.0)
#while [[ -z $SIZE ]]
#do
#SIZE=$(wc -c <"$PWD"/screenlog.0)
#done
while ! [[ -e "$PWD"/cmd_complete ]]
do
sleep 1
done
sleep 2
rm "$PWD"/cmd_complete
> "$PWD"/screenlog.0
#> response
done ##  while [[ 1 ]] | nc -l "${1:-8080}"; 