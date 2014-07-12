#!/usr/bin/env ruby -wKU
words = []
#initialize data
File.foreach("words.txt") { |line| words = line.tr('"', '').split(',') }

#grouping pair by it's length
anagrams = words.map { |word| [word.chars.sort, word] }
                .group_by { |type, _| type }
                .select! { |_, member| member.size > 1 }
                .map { |_, member| member.map { |type, word| word } }
                .group_by { |pair| pair[0].size }

(2 .. 9).reverse_each do |i|
  next unless anagrams[i]
  low, high = Math.sqrt(10**(i-1)).to_i + 1, Math.sqrt(10**(i)).to_i
  max = 0
  (low .. high).each do |num|
    num_str = (num * num).to_s

    anagrams[i].each do |pairs|
      first, *rem = pairs
      next if num_str.tr(num_str, first) != first
      numbers = rem.map { |word| word.tr(first, num_str) }
                   .select { |str| not str.start_with?('0') }.map(&:to_i)

      squares = numbers.select { |n| Math.sqrt(n) % 1 == 0 }
      max = (squares << max).max if numbers.any? { |n| Math.sqrt(n) % 1 == 0 }
    end
  end
  break(puts max) if max > 0
end
