#!/usr/bin/env ruby
grid = []
File.foreach("./matrix.txt") { |line| grid << line.split(',').map(&:to_i) }
nrows = grid.length
cost = grid.map { |row| row[0] }

(1...nrows).each do |i|
  (0...nrows).each do |j|
    cost[j] = [cost[j], cost[j-1]].min + grid[j][i]
  end

  (0...nrows-1).reverse_each do |j|
    cost[j] = [cost[j], cost[j+1] + grid[j][i]].min
  end
end

puts cost.min
