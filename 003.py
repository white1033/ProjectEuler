#!/usr/bin/env python
#-*- coding:utf-8 -*-
target = 600851475143

for div in xrange(2, target):
    while not target % div:
        target /= div
    if target == 1: 
        print(div)
        break
