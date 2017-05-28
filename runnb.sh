]#!/bin/sh
# First argument is the notebook you would like to run
notebook=$1
scriptname="$(basename $notebook .ipynb)".py

# Give process a 4 hours to complete
sudo shutdown +240
sudo -E env "PATH=$PATH" jupyter nbconvert --to script --execute ${notebook} && ipython ${scriptname} > stdout.txt 2> stderr.txt
sudo rm ${scriptname}
sudo shutdown now
