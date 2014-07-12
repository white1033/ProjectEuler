#!/usr/bin/env ruby
def count(m, gap, cache)
  return 0 if gap < m
  return cache[gap] if cache[gap] != -1

  total = 0
  m.upto(gap) do |len|
    total += gap - len + 1
    maxpos = gap - len + 1
    0.upto(maxpos) do |pos|
      total += count(m, gap - len - pos - 1, cache)
    end
  end
  cache[gap] = total
end

def solver(m, n)
  cache = Hash.new { |h, k| h[k] = -1 }
  cache[m] = 1
  count(m, n, cache)
end
puts solver(3, 50)
