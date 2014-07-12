#!/usr/bin/env python
# encoding: utf-8


def main():
    """
    calculate only the even value in fibonacci seq
    """
    ans = 0
    a, b = 2, 0
    while a < 4000000:
        ans += a
        a, b = 4*a+b, a
    print(ans)

if __name__ == '__main__':
    main()
