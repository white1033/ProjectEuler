#!/usr/bin/env python
# encoding: utf-8
from euler import proper_divisor_sum


def main():
    limit, result = 20162, 0
    abundant_numbers = set()

    for num in range(1, limit):
        if proper_divisor_sum(num) > num:
            abundant_numbers.add(num)

        if not any((num - x) in abundant_numbers for x in abundant_numbers):
            result += num
    print(result)


if __name__ == '__main__':
    main()
