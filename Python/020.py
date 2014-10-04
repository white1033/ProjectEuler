#!/usr/bin/env python
# encoding: utf-8
import math


def get_digit_sum(num):
    result = 0
    while num != 0:
        result += num % 10
        num /= 10
    return result


def main():
    print(get_digit_sum(math.factorial(100)))


if __name__ == '__main__':
    main()
