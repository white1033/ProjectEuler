#!/usr/bin/env python
# encoding: utf-8
from collections import deque
from math import sqrt


def product(nums):
    result = 1
    for num in nums:
        result *= num
    return result


def trial_division(n, bound=None):
    if bound is None:
        bound = n

    if n == 1:
        return 1

    for p in [2, 3, 5]:
        if n % p == 0:
            return p

    dif = [6, 4, 2, 4, 2, 4, 6, 2]
    m, i = 7, 1
    while m <= bound and m*m <= n:
        if n % m == 0:
            return m
        m += dif[i % 8]
        i += 1
    return n


def factor(n):
    if n in [-1, 0, 1]:
        return []
    if n < 0:
        n = -n
    result = []
    while n != 1:
        p = trial_division(n)
        e = 1
        n /= p
        while n % p == 0:
            e += 1
            n /= p
        result.append((p, e))
    result.sort()
    return result


def gcd(a, b):
    """
    Returns the greatest common divisor of a and b

    :a: an integer
    :b: an integer
    :returns: an integer, the gcd of a and b

    """
    if a < 0:
        a = -a

    if b < 0:
        b = -b

    if a == 0:
        return b

    if b == 0:
        return a

    while b != 0:
        a, b = b, a % b
    return a


def lcm(a, b):
    return a * b / gcd(a, b)


def nth_prime(n):
    """
    Return the nth prime
    """
    primes = deque([2, 3, 5])
    count = 3
    if n < 1:
        return None

    if n < 5:
        return primes[n-1]

    dif = [6, 4, 2, 4, 2, 4, 6, 2]
    num, i = 7, 1
    while count < n:
        tmp = (x for x in primes if x * x <= num)
        for prime in tmp:
            if num % prime == 0:
                break
        else:
            primes.append(num)
            count += 1

        num += dif[i % 8]
        i += 1
    return primes[-1]


def primes(limit):
    if limit < 2:
        return []

    # The array doesn't need to include even numbers
    lng = ((limit / 2) - 1 + limit % 2)

    # Create array and assume all numbers in array are prime
    sieve = [True] * (lng + 1)

    # In the following code, you're going to see some funky
    # bit shifting and stuff, this is just transforming i and j
    # so that they represent the proper elements in the array.
    # The transforming is not optimal, and the number of
    # operations involved can be reduced.

    # Only go up to square root of the limit
    for i in range(int(sqrt(limit)) >> 1):
        # Skip numbers that aren’t marked as prime
        if not sieve[i]:
            continue

        # Unmark all multiples of i, starting at i**2
        for j in range((i * (i + 3) << 1) + 3, lng, (i << 1) + 3):
            sieve[j] = False

    # Don't forget 2!
    primes = [2]

    # Gather all the primes into a list, leaving out the composite numbers
    primes.extend([(i << 1) + 3 for i in range(lng) if sieve[i]])

    return primes
