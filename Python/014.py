#!/usr/bin/env python
# encoding: utf-8
from euler import memoize


@memoize
def chain_length(n):
    if n == 1:
        return 1

    if n % 2 == 0:
        return 1 + chain_length(n/2)
    else:
        return 1 + chain_length(3*n+1)


def main():
    ans, max_lenth = 0, 0
    for num in range(3, 1000000, 2):
        length = chain_length(num)
        if length > max_lenth:
            ans, max_lenth = num, length

    print(ans)


if __name__ == '__main__':
    main()
