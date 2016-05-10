#!/usr/bin/env python
# encode ASCII to PPM
# TODO: compress to fit more in

infilename = 'asc2ppm.py'
outfilename = 'favicon.ppm'

lines=16
columns=16

eof=128
ppmheader='P3\n' + str(columns) + ' ' + str(lines) + '\n' + str(eof) + '\n'

infile = open(infilename, 'r')
outfile = open(outfilename, 'w')

outfile.write(ppmheader)

for lin in range(lines):
    for col in range(columns):
        # each pixel is RGB (3 channels)
        for chan in range(3):
            c = infile.read(1)
            if not c:
                c = chr(eof)
            outfile.write(str(ord(c)))
            outfile.write(' ')
        if (col != columns-1): outfile.write(' ') # no space at EOL plz
    outfile.write('\n')
    
infile.close()
outfile.close()
