#!/usr/bin/python3

import re
import sys

def print_pair(first_word, second_word):
    pair = first_word + '#' + second_word
    if not (pair in pair_storage):
        pair_storage[pair] = True
        print(pair, 1, sep='\t')

for line in sys.stdin:
    try:
        identifier, article_data = line.split('\t')
    except ValueError:
        continue
    pair_storage={}
    article_data = article_data.rstrip().lower()
    article_data = re.sub('[^a-z\s]+', '', article_data)
    article_data = re.split('[\s]+', article_data)

    for i in range(len(article_data) - 1):
        print_pair(article_data[i], article_data[i + 1])
