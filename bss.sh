#!/bin/bash
PORT=$1
PWD=$(pwd)
DIR=/Volumes/ramdisk
[[ -d "$DIR" ]] || diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://8388608`
DIR=/Volumes/ramdisk/bss
[[ -d "$DIR" ]] || mkdir "$DIR"
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
BSS="bash server.sh 5555 $DIR"
else
BSS="bash server.sh $PORT $DIR"
fi
echo $BSS
#mkfifo var
#script var
#echo "test"

screen -dmS bss -L $BSS
screen -r bss
cd "$PWD"