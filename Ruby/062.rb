#!/usr/bin/env ruby

num = 100
sort_of_digits = Hash.new { |hash, key| hash[key] = 0 }
cube = {}

while true
  x = (num**3).to_s.chars.sort!.join
  cube[x] = num**3 if not sort_of_digits.has_key?(x)
  sort_of_digits[x] += 1
  break if sort_of_digits[x] == 5
  num += 1
end
puts cube[x]
