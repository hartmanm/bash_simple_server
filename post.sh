#!/bin/bash

# Copyright (c) 2019 Michael Neill Hartman. All rights reserved.
# mnh_license@proton.me
# https://github.com/hartmanm

MSG='{"value":"bash!scp!3!dev"}'
## note ! in place of space for sending cmds
## import test
#echo $PWD
#MSG=$(cat "$PWD"/0rig.json)
MSG='{"value":"bash blast"}'
# MAX CHAR 42 for MSG
# example: {"value":"22over9000tothemoonforevermoona"}
## dynamic
CMD="$1"
MSG='{"value":"'$CMD'"}'
/usr/bin/curl -m 5 -s -X POST --output /dev/null localhost:5555 -d "${MSG}"