#!/bin/bash

# Get variable's length
ArgSize=$(expr length $1)

# Verify if argument was given as date (e.g. 2014_05_24, or fullpath)
if [ $ArgSize -eq 10 ]
then
  Folder="/home/pi/Desktop/GreenCover/Output/$1"
else
  Folder="$1"
fi

# Verify if output folder exists (create it otherwise)
[ ! -d "$Folder/GPGGA" ] && mkdir -p "$Folder/GPGGA"

# Outfile
Outfile1 = "/home/pi/Desktop/GreenCover/Output/$1/GPGGA/$1.txt"
Outfile2 = "/home/pi/Desktop/GreenCover/Output/$1/GPGGA/curated_$1.txt"

# Extract all lines containing "GPGGA" in all files and put them in a separate file
cat -e $Folder/Files/*.txt | grep '$GPGGA' > $Outfile1

# Run python code to organize file into columns
python3 OrganizeGPGGA.py $Outfile2
