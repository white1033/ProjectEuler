#!/usr/bin/env ruby -wKU
grid = []
File.foreach('matrix.txt') { |line| grid << line.split(/,/).map(&:to_i) }

(0 ... grid.size).reverse_each do |i|
  (0 ... grid.size).reverse_each do |j|
    next if i == grid.size - 1 && j == grid.size - 1

    if i == grid.size - 1
      min = grid[i][j+1]
    elsif j == grid.size - 1
      min = grid[i+1][j]
    else
      min = [grid[i][j+1], grid[i+1][j]].min
    end

    grid[i][j] += min
  end
end
puts grid[0][0]
