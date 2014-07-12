#!/usr/bin/env ruby -wKU
ans, d, size = 1, 1, 1001
2.step(size, 2) do |i|
  ans += 4 * d + 10 * i
  d += 4 * i
end
puts ans
