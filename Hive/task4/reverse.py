import sys

for line in sys.stdin:
    if line.strip():
        print(line.strip()[::-1])
    else:
        print(NULL)
