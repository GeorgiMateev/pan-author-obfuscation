#!/bin/sh
# First argument is the notebook you would like to run
notebook=$1
scriptname="$(basename $notebook .ipynb)".py

# Give the process some minutes complete
# sudo shutdown +120
sudo -E env "PATH=$PATH" jupyter nbconvert --to script ${notebook} && ipython ${scriptname} > stdout.txt 2> stderr.txt
sudo rm ${scriptname}
sudo shutdown now
