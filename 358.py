#!/usr/bin/env python
from euler import is_prime

def is_primitive(num, prime):
    tmp = prime - 1
    idx = 2
    while idx ** 2 <= tmp:
        if tmp % idx == 0:
            if pow(num, idx, prime) == 1 or pow(num, tmp / idx, prime) == 1:
                return False
        idx += 1
    return True

upper_bound = 729927007
lower_bound = 724709891

for num in xrange(lower_bound, upper_bound, 100000):
    if is_prime(num) and is_primitive(10, num): 
        print((num - 1) * 9 / 2)
