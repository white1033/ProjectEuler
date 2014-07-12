#!/usr/bin/env ruby -wKU
require "prime"

def cycle_length(n)
  len, num = 1, 10
  return 0 if n == 1
  return cycle_length(n / 2) if n.even?
  return cycle_length(n / 5) if n % 5 == 0
  while true
    return len if (num - 1) % n == 0
    len, num = len + 1, num * 10
  end
end

(1 .. 1000).reverse_each do |num|
  if num.prime? and cycle_length(num) == num - 1
    puts num
    break
  end
end
