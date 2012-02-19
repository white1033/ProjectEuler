#!/usr/bin/env ruby

upper_bound = 19_293_949_596_979_899
upper_bound_sqrt = (Math.sqrt(upper_bound) + 1).to_i

while true
  break if (upper_bound_sqrt**2).to_s.match(/1.2.3.4.5.6.7.8.9/)
  upper_bound_sqrt -= 2
end

puts upper_bound_sqrt * 10
