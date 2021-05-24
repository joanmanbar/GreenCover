#!/usr/bin/env python3

import sys


sys.argv[1]


Out_file = str(sys.argv[1])
In_file = str(sys.argv[2])

# Open files
Original = open(Out_file, "r")
Curated = open(In_file, "w")

# Add header
print('Message ID', 'UTC time', 'Latitude', 'N/S Indicator', 'Longitude', 
        'E/W indicator', 'Fix Quality', 'Number of Satellites', 'HDOP', 'Altitude', 
        'Units', 'Geoid Separation', 'Units', 'last DGPS update', 'Checksum', 
        sep = ',', end = '\n', file = Curated)

for line in Original:  
    # Separate columns
    Cols = line.split(",")
    # Cols[0] = "GPGGA" 
    
    # for Col in Cols:
    #     Curated.write(str(Col))
    Curated.write('\t'.join(str(i) for i in Cols))
    
    # Curated.write(line)

# Close files
Original.close()
Curated.close()
