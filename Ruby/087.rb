#!/usr/bin/env ruby
require 'set'
require 'prime'

ans = Set.new
square = Prime.each(7072).map { |p| p**2 }
cube = Prime.each(369).map { |p| p**3 }
zenzizenzic = Prime.each(85).map { |p| p**4 }

square.each do |x|
  cube.each do |y|
    break if x + y > 5e7
    zenzizenzic.each do |z|
      sum = x + y + z
      break if sum > 5e7
      ans << sum
    end
  end
end

puts ans.size
