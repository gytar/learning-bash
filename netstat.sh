#!/usr/bin/env bash

# Learning netstat commands

# this command can be used as an alias in .bashrc file
# this command outputs the number of 80 and 433 connexions in the machine
netstat -plant | grep '80\|443' | grep -vc LISTEN


