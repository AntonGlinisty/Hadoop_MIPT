#!/usr/bin/python3

import sys

for line in sys.stdin:
    line = line.rstrip()
    try:
        pair, count = line.split('\t')
    except ValueError:
        continue
    print(count, pair, sep='\t')
