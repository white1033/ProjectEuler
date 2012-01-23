#!/usr/bin/env python
#-*- coding:utf-8 -*-
from itertools import permutations

target = 1000000
for perm in permutations('0123456789'):
    target -= 1
    if target == 0: break

print ''.join(perm)
