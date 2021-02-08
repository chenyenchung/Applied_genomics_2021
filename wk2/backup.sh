#!/bin/sh

# Defining the path of your project directory
working_path="/scratch/ycc520/ag_examples/ag_recitation/wk2/"

# Make a time stamp so your backup files will be
# named as something like 202102081125.tar.gz
timestamp=$(date +"%Y%m%d_%H%M%S")
filename="backup/$timestamp.tar.gz"


cd $working_path

tar --exclude="./backup" -zcf $filename ./

cd -
