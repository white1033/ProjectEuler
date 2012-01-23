#!/usr/bin/env python
#-*- coding:utf-8 -*-
from euler import dynamic

@dynamic
def cycle_length(n):
    length = 1
    if not n % 2: return cycle_length(n / 2)
    if not n % 5: return cycle_length(n / 5)
    while True:
	if not (10**length - 1) % n: return length
	else: length += 1

ans = 0, 0
for num in xrange(1, 1001):
    length = cycle_length(num)
    if length > ans[1]: ans = num, length

print(ans)
