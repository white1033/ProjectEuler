#!/usr/bin/env python
#-*- coding:utf-8 -*-
from euler import divisor_sum

limit = 20162
ans = 0
abn_nums = set()
for num in xrange(1, limit):
    if divisor_sum(num) > 2 * num:
	abn_nums.add(num)
    if not any( (num - abn in abn_nums) for abn in abn_nums):
	ans += num
 
print(ans)
