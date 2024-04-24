#!/bin/bash

COURSE="Devops for current script"

echo "before calling other script, courese: $COURSE"
echo "current script process ID: $$"

./14-current-script.sh 

echo "after calling other script, course: $COURSE"