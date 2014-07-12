#!/usr/bin/env ruby
def count(m, gap, cache)
  return 0 if gap < m[0]
  return cache[gap] if cache[gap] != -1

  total = 0
  m.each do |len|
    maxpos = gap - len + 1
    total += maxpos
    0.upto(maxpos) do |pos|
      total += count(m, gap - len - pos, cache)
    end
  end
  cache[gap] = total
end

def solver(m, n)
  cache = Hash.new { |h, k| h[k] = -1 }
  cache[m[0]] = 1
  count(m, n, cache) + 1
end
puts solver([*2 .. 4], 50)
