#!/bin/bash

while true;
do
# Get UTC time in YY_M_DD_HH_MM_SS format
Todays_Folder="$(date -u +"%Y_%m_%d")"
Todays_Folder="/home/pi/Desktop/GreenCover/Output/${Todays_Folder}/"

# Verify if Todays_Folder exists (create it otherwise)
[ ! -d "$Todays_Folder/Images" ] && mkdir -p "$Todays_Folder/Images"

# Image name
Image_Name=$(echo $(date -u +"%Y%m%d_%T") | tr : '')
Image_Name="Images/img${Image_Name}.jpg"

raspistill -t 2000 -o "$Todays_Folder$Image_Name"
sleep 2
done

# crontab files
#@reboot bash /home/pi/Desktop/GreenCover/Code/Get_GPS.sh
#@reboot bash /home/pi/Desktop/GreenCover/Code/Get_Pics.sh
#@reboot bash /home/pi/Desktop/GreenCover/Code/Get_Pics.sh
