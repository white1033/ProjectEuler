#!/usr/bin/env python

def is_palindrome(num):
    return str(num) == str(num)[::-1]

def gcd(num1, num2):
    if num1 < 0: num1 = -num1
    if num2 < 0: num2 = -num2
    if num1 == 0: return num2
    if num2 == 0: return num1
    while num2 != 0: num1, num2 = num2, num1 % num2
    return num1

def primes_sieve(n):
    """find all primes in [2, n)"""
    #trivial case
    if n < 2: return []
    if n == 2: return [2]

    #only find primes in odd numbers
    sieve = range(3, n, 2)
    check_ubound = n**.5
    nums_of_sieve = len(sieve)
    num, idx = 3, 0
    while num < check_ubound:
        if sieve[idx]:
            tmp = (num**2 - 3) / 2
            sieve[tmp] = 0
            while tmp < nums_of_sieve:
                sieve[tmp] = 0
                tmp += num
        idx += 1
        num = 2 * idx + 3

    return [2] + [x for x in sieve if x]

def binomial(n, k):
    value = 1
    for x in xrange(min(k, n - k)):
	value = value * (n - x) / (x + 1)
    return value
