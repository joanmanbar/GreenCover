# GreenCover
This repository contains the files to get GPS data and images to estimate green cover in a golf course using a Raspberry Pi (RPi).

The RPi is already set up to start collecting images and GPS data once it's powered. The GPS data is constantly being retrieved while the images are taken every 5-6 seconds.

The file naming system is similar for files and images. It's based on the UTC time when the data was recorded in the form "YYYY_MM_DD_HHMMSS". For example, a file containing the string "2021_05_24_010203" indicates that such a file (either GPS data file or image) was recorded on May 05, 2021 at 01 hours, 02 minutes, and 03 seconds in UTC time.

The "Output" directory should have three subdirectories. One folder contains the raw images and raw GPS data files. A final output .csv file can be created using the `Get_GPGGA.sh` which requires the `OrganizeGPGGA.py` file. The only argument that `Get_GPGGA.sh` requires is the date (YYYY_MM_DD) for which the final output file will be generated. For example, use `bash Get_GPGGA.sh 2021_05_24` will generate a file named "2021_05_24.csv" that has been already curated. Visit http://aprs.gids.nl/nmea/ for information about the variables (column names).
