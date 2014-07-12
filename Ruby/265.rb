#!/usr/bin/env ruby -wKU
seq = ['000001']
26.times do
  tmp = []
  seq.each do |x|
    '01'.each_char do |c|
      tmp.push(x + c) if not x.include?(x[-4 .. -1] + c)
    end
  end
  seq = tmp
end

ans = 0
seq.each do |x|
  flag = true
  4.times do |i|
    if x.include?(x[-1 - i .. -1].ljust(5, '0'))
      flag = false
      break
    end
  end
  ans += x.to_i(2) if flag
end
puts ans
