require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  res = []
  queue = []
  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
  end
  until queue.empty?
    vertex = queue.shift
    res << vertex
    out_edges = vertex.out_edges.dup
    out_edges.each do |edge|
      queue << edge.to_vertex if edge.to_vertex.in_edges.length == 1
      edge.destroy!
    end
  end
  res
end
