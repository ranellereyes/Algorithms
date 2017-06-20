require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  queue = vertices.select { |node| node.in_edges.length == 0 }
  ordered_list = []

  degree = {}
  vertices.each { |node| degree[node.value] = node.in_edges.length }

  until queue.empty?
    curr_node = queue.pop
    ordered_list << curr_node

    curr_node.out_edges .map { |edge| edge.to_vertex }
                        .each { |child| degree[child.value] -= 1 }

    queue = vertices.select do |node|
      degree[node.value] == 0 && !queue.include?(node) && !ordered_list.include?(node)
    end + queue
  end

  return degree.all? { |_, v| v == 0 } ? ordered_list : []
end
