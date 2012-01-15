#!/usr/bin/env python
#-*- coding:utf-8 -*-
def is_nextprime(num, primes):
    for prime in primes:
        if prime**2 > num: return True
        if num % prime == 0: return False

#Using the fact that any primes greater than 3 must be type of 6n+1 or 6n-1
def nth_prime(n):
    primes = [2, 3, 5]
    num_of_primes = 3
    num = 5
    if 0 < n < 3: return primes[n - 1]
    while num_of_primes < n:
        tmp = 1
        num += 3 - tmp
        tmp *= -1
        if is_nextprime(num, primes):
            primes.append(num)
            num_of_primes += 1
    return primes[-1]

print(nth_prime(10001))
