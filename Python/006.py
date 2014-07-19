#!/usr/bin/env python
# encoding: utf-8


def square_sum(n):
    return n * (n + 1) * (2 * n + 1) / 6


def consecutive_sum(n):
    return n * (n + 1) / 2


def main():
    s_n = consecutive_sum(100)
    print(s_n * s_n - square_sum(100))


if __name__ == '__main__':
    main()
