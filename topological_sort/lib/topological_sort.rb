require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's
# def topological_sort(vertices)
#   sorted = []
#   in_count = {}
#   queue = []
#
#   vertices.each do |vertex|
#     in_count[vertex] = in_edge_hash(vertex)
#
#     queue.push(vertex) if in_count[vertex] == 0
#   end
#
#   until queue.empty?
#     current = queue.shift
#     sorted << current
#
#     current.out_edges.each do |edge|
#
#       in_count[edge.to_vertex] -= 1
#
#       queue.push(edge.to_vertex) if in_count[edge.to_vertex] == 0
#     end
#
#     vertices.delete(current)
#   end
#
#   return vertices.empty? ? sorted : []
# end


# Tarjan's
# def topological_sort(vertices)
#   ordering = []
#   explored = Set.new
#
#   vertices.each do |vertex| # O(|v|)
#     dfs!(vertex, explored, ordering) unless explored.include?(vertex)
#   end
#
#   ordering
# end
#
# def dfs!(vertex, explored, ordering)
#   explored.add(vertex)
#
#   vertex.out_edges.each do |edge| # O(|e|)
#     new_vertex = edge.to_vertex
#     dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
#   end
#
#   ordering.unshift(vertex)
# end

# Tarjans with cycle catching
def topological_sort(vertices)
  order = []
  explored = Set.new
  temp = Set.new
  cycle = false

  vertices.each do |vertex|
    cycle = dfs!(vertex, explored, temp, order, cycle) unless explored.include?(vertex)
    return [] if cycle
  end

  order
end


def dfs!(vertex, explored, temp, order, cycle)
  return true if temp.include?(vertex)
  temp.add(vertex)

  vertex.out_edges.each do |edge|
    next_vertex = edge.to_vertex
    cycle = dfs!(next_vertex, explored, temp, order, cycle) unless explored.include?(next_vertex)
    return true if cycle
  end

  explored.add(vertex)
  temp.delete(vertex)
  order.unshift(vertex)
  false
end
