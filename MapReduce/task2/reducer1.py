#!/usr/bin/python3

import sys

count = 1
previous_pair = None

for line in sys.stdin:
    line = line.strip()
    try:
        pair, numb = line.split('\t')
    except ValueError:
        continue
    if (pair != previous_pair):
        if previous_pair != None:
            print(previous_pair, count, sep='\t')
        previous_pair = pair
        count = int(numb)
    else:
        count += int(numb)

print(pair, count, sep='\t')
