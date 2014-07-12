#!/usr/bin/env ruby
# encoding: utf-8
require_relative "euler"

ans = 0
(1 ... 1e6).each do |num|
  if num.to_s.palindromic? && num.to_s(2).palindromic?
    ans += num
  end
end
puts ans
