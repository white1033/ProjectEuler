#!/usr/bin/env python
#-*- coding:utf-8 -*-
from euler import gcd

ans = 2
for num in xrange(3, 21):
    ans *= num / gcd(ans, num)

print(ans)
