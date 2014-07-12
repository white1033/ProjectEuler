#!/usr/bin/env ruby -wKU
numertor, denominator, ans = 3, 2, 0

999.times do
  numertor, denominator = numertor + 2 * denominator, numertor + denominator
  ans += 1 if numertor.to_s.size > denominator.to_s.size
end
puts ans
