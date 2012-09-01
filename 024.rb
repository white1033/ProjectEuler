#!/usr/bin/env ruby
# encoding: UTF-8

target = 1e6
[*0 .. 9].permutation do |perm|
  target -= 1
  if target.zero?
    puts perm.join
    break
  end
end
