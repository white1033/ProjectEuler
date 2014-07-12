#!/usr/bin/env ruby

nums = []
target = 30
(2 .. 600).each do |x|
  (2 .. 50).each do |y|
    num = x ** y
    nums << num if num.to_s.chars.map(&:to_i).reduce(:+) == x
    break if nums.size > target * 1.1
  end
end
nums.sort!
puts nums[target - 1]
