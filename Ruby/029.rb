#!/usr/bin/env ruby
require 'set'

ans = Set.new
(2 .. 100).each do |x|
  (2 .. 100).each do |y|
    ans << (x**y)
  end
end
p ans.size
