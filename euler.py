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

def factorial(n):
    return reduce(lambda x, y: x * y, xrange(1, n + 1), 1)

def divisor_sum(n):
    prime = 2
    div_sum = 1
    while prime**2 <= n and n > 1:
        if not (n % prime):
            tmp = prime**2
            n /= prime
            while not (n % prime):
                tmp *= prime
                n /= prime

            div_sum *= tmp - 1
            div_sum /= prime - 1

        if prime == 2: 
            prime = 3
        else:
            prime += 2

    if n > 1: div_sum *= (n + 1)
    return div_sum

def proper_divisor_sum(n):
    return divisor_sum(n) - n

def dynamic(func):
    cache = {}

    def wrapper(*args):
        try:
            return cache[args]
        except KeyError:
            cache[args] = func(*args)
            pass
        return cache[args]
    return wrapper
