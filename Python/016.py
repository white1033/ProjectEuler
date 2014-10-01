#!/usr/bin/env python
# encoding: utf-8


def main():
    num = 2 ** 1000
    result = 0
    while num:
        result += num % 10
        num /= 10
    print(result)


if __name__ == '__main__':
    main()
