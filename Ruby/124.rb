#!/usr/bin/env ruby

limit, target = 100_000, 10_000
rad = Hash.new { |h, k| h[k] = 1 }
cache = Hash.new { |h, k| h[k] = [] }

(2 .. limit).each do |x|
  if rad[x] == 1
    x.step(limit, x) { |y| rad[y] *= x }
  end
  cache[rad[x]] << x
end

cache.each_value do |v|
  if target <= v.size
    puts v[target - 2] #ignore 1 
    break
  end
  target -= v.size
end
