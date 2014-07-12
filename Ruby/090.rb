#!/usr/bin/env ruby

def update_array(ary)
  flag6 = ary.include?(6)
  flag9 = ary.include?(9)
  if flag6 && flag9 || !flag6 && !flag9
    ary
  elsif flag6
    ary << 9
    return ary
  elsif flag9
    ary << 6
    return ary
  end
end

square_dice = 
  [[0, 1], [0, 4], [0, 9], [1, 6], [2, 5], [3, 6], [4, 9], [6, 4], [8, 1]]
ans = 0

[*0 .. 9].combination(6).to_a.combination(2).each do |ary1, ary2|
  ary1 = update_array(ary1)
  ary2 = update_array(ary2)
  flag = true
  square_dice.each do |x, y|
    if !(ary1.include?(y) && ary2.include?(x)) && 
      !(ary1.include?(x) && ary2.include?(y))
      flag = false
      break
    end
  end
  ans += 1 if flag
end
puts ans
