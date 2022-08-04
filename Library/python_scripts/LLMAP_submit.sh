#!/bin/bash

mapper=submit.sh
input=input_files_ylide_rad_splits_2.txt
output=out_ylide_rad_splits_2
n_nodes=16



LLMapReduce --mapper $mapper --input $input --output $output --np=[$n_nodes,1,1]


