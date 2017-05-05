require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
  dist_to = { source => { prev_vert: nil, cost: 0 } }
  soln_paths = {}
  until dist_to.empty?
    vertex = dist_to.min_by { |k, v| v }[0]
    soln_paths[vertex] = dist_to[vertex]
    dist_to.delete(vertex)
    edges = vertex.edges
    edges.each do |edge|
      new_vert = edge.to_vertex
      new_cost = vertex[:total_cost] + edge.cost
      new_vert_val = dist_to[new_vert]
      new_shorter = !new_vert_val.nil? && new_vert_val[:cost] > new_cost
      if new_vert_val.nil? || new_shorter
        dist_to[new_vert] = { prev_vert: vertex, cost: new_cost }
      end
    end
  end
  p soln paths
end
