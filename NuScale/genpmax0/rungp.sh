#!/bin/bash

# genpmax runs quickly, no need to submit a job

exec=/usr/local/usrapps/ardor/shared/parcs_tmp/GenPMAXS/Executables/Linux/genpmaxs-v6.3.4-linux2-gfortran-x64-release.x

clist=$(ls gen*.inp)
for case in $clist; do
  echo "running case $case"
  $exec $case
done

echo "done"
