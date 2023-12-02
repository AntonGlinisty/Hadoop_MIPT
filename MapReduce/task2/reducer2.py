#!/usr/bin/python3

import sys

for line in sys.stdin:
    line = line.rstrip()
    try:
        count, pair = line.split('\t')
    except ValueError:
        continue
    first_word, second_word = pair.split('#')
    print(first_word, second_word, count)
