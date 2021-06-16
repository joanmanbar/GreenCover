#!/bin/bash

# Get variable's length
ArgSize=$(expr length $1)

# Verify if argument has 10 characters as in "2021_05_24", for example, or is a fullpath (first one recommended)
if [ $ArgSize -eq 10 ]
then
  Folder="/home/pi/Desktop/GreenCover/Output/$1"
else
  Folder="$1"
fi

# Verify if output folder exists (create it otherwise)
[ ! -d "$Folder/GPGGA" ] && mkdir -p "$Folder/GPGGA"

# Files names for OrganizeGPGGA.py 
Outfile1="/home/pi/Desktop/GreenCover/Output/$1/GPGGA/$1.txt"
Outfile2="/home/pi/Desktop/GreenCover/Output/$1/GPGGA/curated1_$1.txt"

# Extract all lines containing "GPGGA" in all GPS files and put them in a separate file
cat -e $Folder/Files/*.txt | grep '$GPGGA' > $Outfile1

# Run python code to organize file into columns
python3 OrganizeGPGGA.py $Outfile1 $Outfile2
