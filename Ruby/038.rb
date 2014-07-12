#!/usr/bin/env ruby
require_relative 'euler'

(9123 .. 9876).reverse_each do |num|
  if (num.to_s << (num * 2).to_s).pandigital?
    puts num.to_s << (num * 2).to_s
    break
  end
end
