#!/usr/bin/env ruby

p (1 ... 1000).select{ |x| x % 3 == 0 || x % 5 == 0}.reduce(:+)
