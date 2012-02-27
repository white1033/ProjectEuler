#!/usr/bin/env python
#-*- coding:utf-8 -*-

import itertools, euler

prod_set = itertools.product(xrange(100, 1000), xrange(100, 1000))
Max = 0
for a, b in prod_set:
    if euler.is_palindrome(a * b) and a * b > Max:
        Max = a * b

print(Max)
