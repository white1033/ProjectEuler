#!/usr/bin/env ruby
$grid = {}
$rows, $cols = 80, 80

File.foreach('./matrix.txt').each_with_index do |line, i|
  line.split(',').each_with_index do |num, j|
    $grid[[i,j]] = num.to_i
  end
end

def find_neighbors(vertex)
  i, j = *vertex
  output = [[i, j-1], [i, j+1], [i-1, j], [i+1, j]]
  remove = []
  output.each do |v|
    if v[0] < 0 || v[0] >= $rows || v[1] < 0 || v[1] >= $cols
      remove << v
    end
  end
  return output - remove
end

def dka(graph, source)
  dist = {}
  graph.each_key do |key|
    dist[key] = Float::INFINITY
  end
  dist[source] = graph[source]
  tmp = dist.clone
  len = tmp.length
  while len > 0
    u = tmp.min[0]
    break if dist[u] == Float::INFINITY
    break if u == [79, 79]
    tmp.delete(u)
    len -= 1
    n = find_neighbors(u)
    neighbors = n.keep_if { |node| tmp.has_key?(node) }
    neighbors.each do |v|
      alt = dist[u] + $grid[v]
      if alt < dist[v]
        dist[v], tmp[v] = alt, alt
      end
    end
  end

  return dist
end

ans = dka($grid, [0, 0])
puts ans[[79, 79]]
