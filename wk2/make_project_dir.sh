#!/bin/sh

# Make a directory to store the raw data
mkdir data

# Make a directory to store the intermediate files
# Aligned sequence, SingleCellExperiment objects, and etc.
mkdir int_file

# Make a directory to store plots
mkdir img

# Make a directory to store tables
mkdir table

# Make a directory to store HPC job scripts
mkdir job_script

# Make a directory to store HPC job reports
mkdir job_report

# Make a directory to store backup files
# You will want to do this from time to time
mkdir backup

# Make a README file before you forget
touch README.md
