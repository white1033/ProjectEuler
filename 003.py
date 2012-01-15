#!/usr/bin/env python
#-*- coding:utf-8 -*-
target = 600851475143

for div in xrange(2, int(target**.5)):
    while not target % div: target /= div
    if target == 1: break

print(div)
