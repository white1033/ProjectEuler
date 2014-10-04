#!/usr/bin/env python
# encoding: utf-8
from euler import proper_divisor_sum


def main():
    result = 0
    for num in range(2, 10001):
        proper_sum = proper_divisor_sum(num)

        if num != proper_sum and proper_divisor_sum(proper_sum) == num:
            result += proper_sum

    print(result)


if __name__ == '__main__':
    main()
