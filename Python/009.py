#!/usr/bin/env python
# encoding: utf-8
from math import sqrt


def main():
    limit = int(sqrt(1000))
    for i in range(1, limit, 2):
        for j in range(i+1, limit, 2):
            a, b, c = j * j - i * i, 2 * i * j, i * i + j * j
            if a + b + c == 1000:
                print(a * b * c)
                break


if __name__ == '__main__':
    main()
