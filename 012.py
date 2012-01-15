#!/usr/bin/env python
#-*- coding:utf-8 -*-
from euler import primes_sieve

num = 3
num_of_div = 2 #the number of divisors of any prime numbers
num_of_div_sofar = 0
primes = primes_sieve(1000)

while num_of_div_sofar <= 500:
    num += 1
    nextnum = num
    if not nextnum % 2: nextnum /= 2
    tmp_num_of_div = 1
    for prime in primes:
        if prime**2 > nextnum:
            tmp_num_of_div *= 2
            break
        
        expon = 1
        while not nextnum % prime:
            expon += 1
            nextnum /= prime

        if expon > 1: tmp_num_of_div *= expon
        if nextnum == 1: break

    num_of_div_sofar = num_of_div * tmp_num_of_div
    num_of_div = tmp_num_of_div

print(num * (num - 1) / 2)
