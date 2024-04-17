#!/bin/bash

Username=$1
Password=$2

echo "Please enter Username"

read -s $Username

echo "Please enter Password"

read -s $Password

echo "Username is: $1, Password is: $2"