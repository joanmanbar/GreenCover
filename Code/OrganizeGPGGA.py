#!/usr/bin/env python3


import sys
import pandas as pd


In_file = str(sys.argv[1])
Out_file1 = str(sys.argv[2])


# Open files
Original = open(In_file, "r")
Curated = open(Out_file1, "w")

# Colnames

# Add header
print('Message ID', 'UTC time', 'Latitude', 'N/S Indicator', 'Longitude', 
        'E/W indicator', 'Fix Quality', 'Number of Satellites', 'HDOP', 'Altitude', 
        'Units', 'Geoid Separation', 'Units', 'last DGPS update', 'Checksum', 
        sep = '\t', end = '\n', file = Curated)

for line in Original:  
    # Separate columns
    Cols = line.split(",")
    Cols[0] = "GPGGA" 
    
    # for Col in Cols:
    #     Curated.write(str(Col))
    Curated.write('\t'.join(str(i) for i in Cols))
    
    # Curated.write(line)

# Close files
Original.close()
Curated.close()


# Average across duplicates
df = pd.read_csv(Out_file1, sep = "\t", error_bad_lines=False, index_col=False)
# df.head()

df[['Longitude', 'Latitude', 'Fix Quality', 'Altitude']] = df[['Longitude', 'Latitude', 'Fix Quality', 'Altitude']].apply(pd.to_numeric, errors="coerce")
# df.applymap(np.isreal).all(1)

# Remove rows without Longitude (or lattitude) data
df = df.dropna(subset=['Longitude', 'Fix Quality', 'Altitude', 'Checksum'])

# Get average at unique time
df2 = df.groupby('UTC time', as_index=False).mean()

# Export .csv file
csv_name = Out_file1.split(".")[0]
csv_name = csv_name + ".csv"
df2.to_csv(csv_name, index=False)
