#!/usr/bin/env python
#-*- coding:utf-8 -*-

print(abs(sum(x**2 for x in xrange(1, 101)) - sum(xrange(1, 101))**2))

