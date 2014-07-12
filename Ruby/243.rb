#!/usr/bin/env ruby -wKU
require "prime"

primes = Prime.first(9) #After first try, I only take the first nine primes. 
ratio = [15499, 94744]

frac = [1, 1]
primes.each do |prime|
  frac = [frac[0] * (prime - 1), frac[1] * prime]
  (2 ... prime).each do |e|
    if frac[0] * e * ratio[1] < ratio[0] * (frac[1] * e - 1)
      puts frac[1] * e
      break
    end
  end
end

