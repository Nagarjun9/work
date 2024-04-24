#!/bin/bash

COURSE="Devops for current script"

echo "before calling other script, courese: $COURSE"
echo "current script process ID: $$"

./15-other-script.sh 

echo "after calling other script, course: $COURSE"