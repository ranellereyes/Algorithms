# Post Order Traversal:

def post_order_traversal(tree_node = @root, arr = [])
  return nil if tree_node.nil?
  return tree_node.value if tree_node.children.empty?

  arr += in_order_traversal(tree_node.left)
  arr += in_order_traversal(tree_node.right)
  arr << tree_node.value

  return arr.reject { |e| e.nil? }
end
# Pre Order Traversal:

def pre_order_traversal(tree_node = @root, arr = [])
  return nil if tree_node.nil?
  return tree_node.value if tree_node.children.empty?

  arr << tree_node.value
  arr += in_order_traversal(tree_node.left)
  arr += in_order_traversal(tree_node.right)

  return arr.reject { |e| e.nil? }
end

# In Order Iterative:

def in_order_traversal_iterative(tree_node = @root)
  arr = []
  stack = [tree_node]

  until tree_node.nil? && stack.empty?
    stack.last.children.reverse.each { |node| stack << node }
    tree_node = stack.pop
  end

  arr  
end

# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.
