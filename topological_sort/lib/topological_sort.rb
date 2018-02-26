require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's
def topological_sort(vertices)
  sorted = []
  in_count = {}
  queue = []

  vertices.each do |vertex|
    in_count[vertex] = in_edge_hash(vertex)

    queue.push(vertex) if in_count[vertex] == 0
  end

  until queue.empty?
    current = queue.shift
    sorted << current

    current.out_edges.each do |edge|

      in_count[edge.to_vertex] -= 1

      queue.push(edge.to_vertex) if in_count[edge.to_vertex] == 0
    end

    vertices.delete(current)
  end

  return vertices.empty? ? sorted : []
end


# Tarjan's
# def topological_sort(graph)
#   output = []
#   visited = Hash.new(false)
#   queue = []
#
#   graph.each do |vertex|
#
#     if in_edge_hash(vertex) == 0
#       queue.push(vertex)
#     end
#   end
#
#   until queue.empty?
#     current = queue.shift
#
#     current.out_edges.each do |edge|
#       if !visit(edge.to_vertex, output, visited)
#
#       end
#
#   end
#
#
#
# end
#
# # helper methods
# def visit(current_node, prev_node, leaves, visited)
#   if current_node.out_edges.empty? && !visited[current_node]
#     leaves.unshift(current_node)
#
#     visited[current_node] = true
#   else
#     false
#   end
# end

def in_edge_hash(vertex)
  count = 0
  vertex.in_edges.length
end
