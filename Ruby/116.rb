#!/usr/bin/env ruby
def count(m, gap, cache)
  return 0 if gap < m
  return cache[gap] if cache[gap] != -1

  total = gap - m + 1
  maxpos = total
  0.upto(maxpos) do |pos|
    total += count(m, gap - m - pos, cache)
  end
  cache[gap] = total
end

def solver(m, n)
  cache = Hash.new { |h, k| h[k] = -1 }
  cache[m] = 1
  count(m, n, cache)
end

puts [*2 .. 4].map { |e| solver(e, 50) }.reduce(:+)
