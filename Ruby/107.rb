class UnionFind
  def initialize(n)
    @nodes = Array.new(n) { |i| i }
  end
  
  def connected?(node1, node2)
    @nodes[node1] == @nodes[node2]
  end
  
  def union(node1, node2)
    node_1, node_2 = @nodes[node1], @nodes[node2]
    @nodes.map! { |i| (i == node_1) ? node_2 : i }
  end
end

edges = []
File.foreach('network.txt').each_with_index do |line, i|
  line.split(',').each_with_index do |weight, j|
    edges << {from: i, to: j, weight: weight.to_i} if weight[/\d+/] && j > i
  end
end
edges.sort_by! { |e| e[:weight] }

mst = []
nodes = UnionFind.new(40)
edges.each do |edge|
  unless nodes.connected?(edge[:from], edge[:to])
    mst << edge
    nodes.union(edge[:from], edge[:to])
  end
end

puts( (edges - mst).reduce(0) { |acc, e| acc + e[:weight] } )
