#!/usr/bin/env bash

read -p "what's ur name?\n" name
echo "hello ${name}"

# arrays 
my_array=("test" "hello" "how are you" "fine")
echo ${my_array[@]}
echo ${my_array[@]:2:3}
