#!/usr/bin/env ruby -wKU

def terminate(m, d, a)
  (0 ... a.size - 1).each do |i|
    return true if m[i] == m[-1] && d[i] == d[-1] && a[i] == a[-1]
  end
  return false
end

def continued_fraction(num)
  m = [0]
  d = [1]
  a = [Math.sqrt(num).floor]

  while not terminate(m, d, a)
    m << d[-1] * a[-1] - m[-1]
    d << (num - m[-1]**2) / d[-1]
    a << ((Math.sqrt(num) + m[-1]) / d[-1]).floor
  end

  return a.size - 2
end

ans = 0
(1 .. 10000).each do |num|
  next if Math.sqrt(num) == Math.sqrt(num).to_i
  ans += 1 if continued_fraction(num).odd?
end
puts ans
