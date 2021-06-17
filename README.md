# GreenCover
This repository contains the files to get GPS data and images to estimate green cover in a golf course using a Raspberry Pi (RPi).

The RPi is already set up to start collecting images and GPS data while powered. This is because the `Get_GPS.sh` and `Get_Pics.sh` files were scheduled in CRON. To visualize/edit the scheduling file type `crontab -e` in the terminal. To verify that the scheduled jobs are running, type `systemctl status cron` in the terminal. 


## Folders 

### Code
Contains the `.py` and `.sh` files. Both GPS data and images are contantly being The GPS data is constantly being retrieved while the images are taken every 5-6 seconds.
The file naming system is similar for files and images. It's based on the UTC time when the data was recorded in the form "YYYY_MM_DD_HHMMSS". For example, a file containing the string "2021_05_24_010203" indicates that such a file (either GPS data file or image) was recorded on May 05, 2021 at 01 hours, 02 minutes, and 03 seconds in UTC time. 

The only file that needs to be manually executed in the terminal window is `Get_GPGGA.sh`. To do so, follow the next steps: \
1. Open a terminal window and `cd` into the **Code** folder: \
`cd ~/Desktop/GreenCover/Code` \
2. Execute the bash script providing the folder (date) from which you want to extract the GPGGA data. For example, to retrieve the GPGGA data from the folder 2021_05_24, type: \
`bash Get_PGGA.sh 2021_05_24`. \
3. Transfer all files from the folder date to another device to and clean up the RPi's SD card.

### Output
Contains one folder per date, and within each of them, there will be three subfolders: \
**Files**: Contains the GPS data. Each `.txt` file is named after the data and UTC time at which the RPi was powered on. \
**Images**: Contains the `.jpg` images, named after the date and UTC time at which the picture was taken. \
**GPGGA**: Is created automatically when executing the `Get_GPGGA.sh` file. This folder will contain the a `.txt` and a `.csv` version of the "curated" data file, i.e., the file with the GPGGA variables of interest. \

## To do! (if necessary)
- A file that associates/pairs images with GPS data...



Contact me (Joan) for more information. \
jbarreto@umn.edu | jmbarretoo@gmail.com
