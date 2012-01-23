#!/usr/bin/env python
#-*- coding:utf-8 -*-
from math import sqrt, log10

GoldenRatio = (1 + sqrt(5)) / 2
print(int((1000 - log10(sqrt(5))) / log10(GoldenRatio)) - 1)
