#!/usr/bin/env ruby
# encoding: utf-8
require_relative "euler"

ans = 0
(2 .. 1e4).each do |x|
  y = x.proper_divisor_sum
  if x != y && y.proper_divisor_sum == x
    ans += y
  end
end

puts ans
