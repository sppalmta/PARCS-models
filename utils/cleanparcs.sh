#!/bin/bash

# Script to clean up output files created by Parcs

rm -f err.* out.*
rm -f *.inp_parcs_err
rm -f *.parcs_cyc*
rm -f *.parcs_dep
rm -f *.parcs_dpl
rm -f *.parcs_msg
rm -f *.parcs_out
rm -f *.parcs_rod
rm -f *.parcs_rst*
rm -f *.parcs_sum
rm -f *.parcs_xml

echo "cleaned"
