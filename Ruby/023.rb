#!/usr/bin/env ruby
# encoding: utf-8
require "set"
require_relative "euler"

limit = 20162
ans = 0
abn_nums = Set.new

(1 ... limit).each do |num|
  abn_nums << num if num.proper_divisor_sum > num

  flag = true
  abn_nums.each do |abn|
    if abn_nums.include?(num - abn)
      flag = false
      break
    end
  end

  ans += num if flag
end

puts ans
