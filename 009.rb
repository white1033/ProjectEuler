#!/usr/bin/env ruby

target = 1000
limit = Math.sqrt(target)
1.step(limit, 2) do |i|
  (i + 1).step(limit, 2) do |j|
    a, b, c = j**2 - i**2, 2 * i * j, i**2 + j**2
    if a + b + c == target
      puts a * b * c
      break
    end
  end
end
