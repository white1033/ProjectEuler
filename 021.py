#!/usr/bin/env python
#-*- coding:utf-8 -*-
from euler import proper_divisor_sum

ans = 0
for i in xrange(2, 10000):
    j = proper_divisor_sum(i)
    if i != j and proper_divisor_sum(j) == i:
        ans += j

print(ans)
