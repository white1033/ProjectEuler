#!/usr/bin/env python
# encoding: utf-8
from euler import lcm


def main():
    ans = reduce(lcm, range(11, 21))
    print(ans)


if __name__ == '__main__':
    main()
