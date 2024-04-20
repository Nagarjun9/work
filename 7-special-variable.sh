#!/bin/bash

echo "all variables: $@"
echo "Number of variable passed: $#"
echo "script name: $0"
echo "current working direcoty: $PWD"
echo "Home directoy of current user: $HOME"
echo "which use run the script: $USER"
echo "Hostname: $HOSTNAME"
echo "process id of current shell script: $$"
sleep 90 &
echo "process id of last backend script: $!"

