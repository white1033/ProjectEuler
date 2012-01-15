#!/usr/bin/env python
#-*- coding:utf-8 -*-

target = 1000

limit = int(target**.5)
for i in xrange(1, limit, 2):
    for j in xrange(i + 1, limit, 2):
        a, b, c = j**2 - i**2, 2 * i * j, i**2 + j**2
        if a + b + c == target:
            print(a * b * c)
            break
