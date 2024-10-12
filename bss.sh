#!/bin/bash

# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

PORT=$1
[[ `which screen` == "" ]] && {
sudo apt update
sudo apt install -y screen
}
[[ `which nc` == "" ]] && {
sudo apt update
sudo apt install -y netcat
}
PWD=$(pwd)
DIR=/tmp
#DIR=/Volumes/ramdisk
#[[ -d "$DIR" ]] || diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://8388608`
DIR="${DIR}/bss"
[[ -d "$DIR" ]] || mkdir -p "$DIR"
> "$PWD"/screenlog.0 
SIZE=$(wc -c <"$PWD"/screenlog.0)
[[ -z $SIZE ]] || > "$DIR"/screenlog.0
BSS="$PWD"/server.sh
CONNECTOR="$PWD"/connector
BLAST="$PWD"/blast
cp "$BSS" "$DIR"
cp "$CONNECTOR" "$DIR"
cp "$BLAST" "$DIR"
cd "$DIR"
if [[ -z $1 ]]
then
BSS="bash server.sh 3001 $DIR"
else
BSS="bash server.sh $PORT $DIR"
fi
echo $BSS
screen -dmS bss -L $BSS
screen -r bss
cd "$PWD"
