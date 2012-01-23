#!/usr/bin/env python
#-*- coding:utf-8 -*-
def name_score(name):
    return sum(ord(a) - 64 for a in name)

text = open('names.txt').read()
names = sorted(text.replace('"', '').split(','))
ans = 0
for idx, name in enumerate(names):
    ans += name_score(name) * (idx + 1)

print(ans)
