#!/bin/bash

cat -e /home/pi/Desktop/Pic_GPS/Output/$1/*txt | grep '$GPGGA' > /home/pi/Desktop/Pic_GPS/Output/GPGGA/$1.txt
