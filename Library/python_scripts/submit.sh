#!/bin/bash

# Initialize Modules
source /etc/profile

export DIRECTORY="$(dirname "$1")"
export BASENAME="$(basename -- $1)"
echo "BASENAME IS $BASENAME"

bash gaussian_submission.sh "$1.com" > $2


#Example of how to use this script, paste this into the command line when logged into the MIT supercloud

# "LLMapReduce --mapper submit.sh --input input_files_ylide_h_splits_0.txt --output out_ylide_h_0 --np=[16,1,1]" 
