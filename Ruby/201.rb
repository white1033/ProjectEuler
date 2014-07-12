#!/usr/bin/env ruby -wKU
def solve(n, m)
  values = [*1 .. n].map { |e| e * e }
  ways = [[0, 0]] * (m + 1)
  ways[0] = [1, 0]
  values.each do |v|
    (1 .. m).reverse_each do |i|
      a1, a2 = ways[i-1]
      b1, b2 = ways[i]
      a1 <<= v
      a2 <<= v
      many = a2 | b2
      ways[i] = [(a1 ^ b1) & ~many, many | (a1 & b1)]
    end
  end

  uniq = ways[m][0]
  count, total = 0, 0
  count = uniq.to_s(2).count('1')
  total = count * values.reduce(:+) / 2

  return total
end

puts solve(100, 50)
