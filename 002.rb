#!/usr/bin/env ruby -wKU

fibs = [1, 1]
ans = 0
while fibs[0] < 4e6
  ans += fibs[0] if fibs[0].even?
  *fibs = fibs[1], fibs[0] + fibs[1]
end
puts ans
