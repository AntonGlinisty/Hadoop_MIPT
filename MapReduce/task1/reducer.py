#!/usr/bin/python3

import sys
import random

current_word_numb = 0
words_in_line = random.randint(1, 5)

for line in sys.stdin:
    line = line.strip()
    random_number, identifier = line.split('\t', 1)
    if current_word_numb == words_in_line - 1:
        print(identifier)
        current_word_numb = 0
        words_in_line = random.randint(1, 5)
    else:
        print(identifier, end=',')
        current_word_numb += 1
