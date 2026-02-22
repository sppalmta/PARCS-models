#!/bin/bash

#BSUB -J parcs4 
#BSUB -o out.%J
#BSUB -e err.%J
#BSUB -n 1
#BSUB -W 1:00
#x BSUB -q casl

# Submission script for NC State Hazel cluster

# run uname to get the name and machine information
uname -n
uname -a
exec=/usr/local/usrapps/ardor/shared/parcs_tmp/ex/parcs-v345-linux2-intel-x64-release.x

# check to see if the parcs executable is available
if [ ! -f $exec ]; then
  ls -Fl $exec
  echo "PARCS executable not found"
  exit 1
fi

# run the case

clist=$(ls nuscale*inp)
for case in $clist; do
  $exec $case
done

echo "finished with all cases"

