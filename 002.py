#!/usr/bin/env python
#-*- coding:utf-8 -*-

fib1, fib2 = 1, 1
sum_fibs = 0
while fib1 < 4000000:
    if not fib1 % 2:
        sum_fibs += fib1
    fib1, fib2 = fib2, fib1 + fib2

print(sum_fibs)
