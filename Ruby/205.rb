#!/usr/bin/env ruby

dice1 = Hash[ Array.new(4) { |i| [i + 1, 1] } ]
dice2 = Hash[ Array.new(6) { |i| [i + 1, 1] } ]

def compose(hash1, hash2)
  hash3 = Hash.new { |hash, key| hash[key] = 0 }
  hash1.each_key do |key1|
    hash2.each_key { |key2| hash3[key1 + key2] += hash1[key1] * hash2[key2] }
  end
  return hash3
end

def ndice(dice, n)
  ([dice] * n).reduce { |a, e| compose(a, e) }
end

def solve(hash1, hash2)
  sum, total = 0, 0
  hash1.each_key do |key1|
    hash2.each_key do |key2|
      tmp = hash1[key1] * hash2[key2]
      sum += tmp if key1 > key2
      total += tmp
    end
  end
  return sum * 1.0 / total
end

puts "%.7f" % solve(ndice(dice1, 9), ndice(dice2, 6))
