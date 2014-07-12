#!/usr/bin/env ruby
# encoding: utf-8
require "mathn"

class String

  def palindromic?
    self == reverse
  end

  def pandigital?(n = 9)
    '123456789'[0 ... n].tr(self, '').empty?
  end
end

class Integer
  
  def proper_divisor_sum
    sum = 1
    sqrt_num = Math.sqrt(self)

    (2 .. sqrt_num).each do |e|
      sum += (e + self / e) if self % e == 0
    end

    sum -= sqrt_num if sqrt_num.to_i == sqrt_num

    sum
  end

  def divisor_sum
    proper_divisor_sum + self
  end

end
