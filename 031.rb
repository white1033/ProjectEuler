#!/usr/bin/env ruby

target = 200
coins = [1, 2, 5, 10, 20, 50, 100, 200]
num_of_ways = [1] + Array.new(target) { |i| 0 }

coins.each do |coin|
  (coin .. target).each do |i|
    num_of_ways[i] += num_of_ways[i - coin]
  end  
end

puts num_of_ways[target]
