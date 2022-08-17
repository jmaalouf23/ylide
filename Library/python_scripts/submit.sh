#!/bin/bash

# Initialize Modules
source /etc/profile

export DIRECTORY="$(dirname "$1")"
export BASENAME="$(basename -- $1)"
echo "BASENAME IS $BASENAME"

bash gaussian_submission.sh "$1.com" > $2


#Example of how to use this script, paste this into the command line when logged into the MIT supercloud

# "LLMapReduce --mapper submit.sh --input input_files_ylide_rad_splits_3.txt --output out_ylide_rad_3 --np=[16,1,1]" 
