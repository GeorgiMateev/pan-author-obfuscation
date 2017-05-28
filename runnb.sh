#!/bin/sh
# First argument is the notebook you would like to run
notebook=$1
scriptname="$(basename $notebook .ipynb)".py

# Give process a 4 hours to complete
shutdown +240
jupyter nbconvert --to script --execute ${notebook} && python ${scriptname} > stdout.txt 2> stderr.txt
rm ${scriptname}
shutdown now