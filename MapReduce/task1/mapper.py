#!/usr/bin/python3

import sys
import random

for line in sys.stdin:
    line = line.strip()
    identifiers = line.split()
    for identifier in identifiers:
        print(random.randint(0, 1e9), identifier, sep='\t')
