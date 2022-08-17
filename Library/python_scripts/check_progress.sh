#!/bin/bash
#Joseph H. Maalouf
#This script checks the progess of my DFT calculations on the MIT supercloud to see how many 
#Have completed

Help()
{
   # Display Help
   echo "Valid first arguments are ylide, ylide_h_1, and ylide_h_2"

}

while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done


if [[ $1 == '1' ]];
then
input='input_files_ylide_rad_splits_0.txt'
output='out_ylide_rad_0'
elif [[ $1 == '2' ]];
then
input='input_files_ylide_rad_splits_1.txt'
output='out_ylide_rad_1'
elif [[ $1 == '3' ]];
then 
input='input_files_ylide_rad_splits_2.txt'
output='out_ylide_rad_2'
elif [[ $1 == '4' ]];
then 
input='input_files_ylide_rad_splits_3.txt'
output='out_ylide_rad_3'
else
echo "VALID INPUT NOT GIVEN"
exit
fi


num_completed=$(ls $output | wc -l)



total=$(wc -l $input | awk '{ print $1 }')

percent=$(( 100 * num_completed / total ))

echo "$num_completed calculations have finished out of $total, which is $percent %"
