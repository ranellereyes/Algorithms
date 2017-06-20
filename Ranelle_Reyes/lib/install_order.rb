# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'topological_sort'

def install_order(arr)
  vertices = []
  arr.flatten.max.times do |i|
    vertices << Vertex.new(i + 1)
  end

  arr.each do |dep|
    Edge.new(vertices[dep[1] - 1], vertices[dep[0] - 1])
  end

  topological_sort(vertices).map { |node| node.value }
end
