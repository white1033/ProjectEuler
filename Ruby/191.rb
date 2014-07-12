#!/usr/bin/env ruby -wKU
N = 30
prize = [ { [0, 0] => 1 } ]
1.upto(31) do |i|
  tmp = Hash.new { |h, k| h[k] = 0 }
  prize[i-1].each do |k, v|
    tmp[ [0, k[1]] ] += v
    tmp[ [0, 1] ] += v if k[1].zero?
    tmp[ [k[0]+1, k[1]] ] += v if k[0] < 2
  end
  prize << tmp
end
puts prize[N].values.reduce(:+)
