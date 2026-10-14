#!/bin/bash

###########################
# 
# Author : Naveen
#
# Date   : 20/06/2024
#
# To find health of a node/vm
#
###########################

set -x #debug mode

set -e # to show error in the script

set -o pipefail # to show pipefailure in the scipt

df -h # to find the drive sizes on linux

free -g # to check memory usage

nproc # to check nummber of processors

ps -ef | grep "python" | awk -F" " '{print $2}'


