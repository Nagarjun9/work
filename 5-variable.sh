#!/bin/bash

Username=$1
Password=$2

echo "please enter Username"

read -s $Username

echo "please enter Password"

read -s $Password

echo "Username is: $1, Password is: $2"