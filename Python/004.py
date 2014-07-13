#!/usr/bin/env python
# encoding: utf-8


def make_palindrome(num):
    num_str = str(num)
    return int(num_str + num_str[::-1])


def find_num(num):
    for i in reversed(range(100, 1000)):
        if num % i == 0 and num / i < 1000:
            return True
    return False


def main():
    for num in reversed(range(100, 1000)):
        palindrome = make_palindrome(num)
        if find_num(palindrome):
            print(palindrome)
            break

if __name__ == '__main__':
    main()
