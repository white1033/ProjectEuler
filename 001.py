#!/usr/bin/env python
#-*- coding:utf-8 -*-

print(sum(x for x in xrange(1, 1000) if not (x % 3) or not (x % 5)))
