#!/bin/bash

# Get UTC time in YY_M_DD_HH_MM_SS format
Todays_Folder="$(date -u +"%Y_%m_%d")"
Todays_Folder="/home/pi/Desktop/GreenCover/Output/${Todays_Folder}/"

# Verify if Todays_Folder exists (create it otherwise)
[ ! -d "$Todays_Folder/Files" ] && mkdir -p "$Todays_Folder/Files"

# GPS data file name
Filename=$(echo $(date -u +"%Y%m%d_%T") | tr -d :)
Filename="Files/file${Filename}.txt"

while true;
do
cat /dev/serial0 >> "$Todays_Folder$Filename"
done

# crontab files
#@reboot bash /home/pi/Desktop/GreenCover/Code/Get_GPS.sh
#@reboot bash /home/pi/Desktop/GreenCover/Code/Get_Pics.sh
