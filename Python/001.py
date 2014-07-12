#!/usr/bin/env python
# encoding: utf-8
from euler import product
from itertools import combinations


def sum_divisble_by(n, p):
    return n * (p / n) * (p / n + 1) / 2


def ans(upper_bound, nums):
    result = 0
    for i in range(1, len(nums)+1):
        for each in combinations(nums, i):
            if i % 2:
                result += sum_divisble_by(product(each), upper_bound-1)
            else:
                result -= sum_divisble_by(product(each), upper_bound-1)
    return result


def main():
    print(ans(1000, [3, 5]))

if __name__ == '__main__':
    main()
