#!/bin/bash

# Initialize Modules
source /etc/profile

export DIRECTORY="$(dirname "$1")"
export BASENAME="$(basename -- $1)"

echo "BASENAME IS $BASENAME"
# Call your script as you would from the command line


bash gaussian_submission.sh "$1.com" > $2

# "LLMapReduce --mapper submit.sh --input input_files_ylide_h_splits_2.txt --output out_ylide_h_2 --np=[16,1,1]" 

# "LLMapReduce --mapper submit.sh --input input_files_ylide_h_splits_3.txt --output out_ylide_h_3 --np=[14,1,1]" 

# "LLMapReduce --mapper submit.sh --input input_files_ylide_splits_0.txt --output out_ylide_0 --np=[14,1,1]" 