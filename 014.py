#!/usr/bin/env python
#-*- coding:utf-8 -*-

cache = { 1 : 1 }
def chain(n):
    if not n in cache:
        cache[n] = chain(3 * n + 1 if n % 2 else n / 2) + 1
    return cache[n]
 
Max = (0, 0)
limit = 1000000
for i in xrange(3, limit, 2):
    chain_length = chain(i)
    if chain_length > Max[1]: Max = (i, chain_length)
 
print(Max)
