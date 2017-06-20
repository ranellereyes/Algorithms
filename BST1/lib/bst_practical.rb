require "binary_search_tree"

def kth_largest(tree_node, k)
  bst = BinarySearchTree.new()
  bst.root = tree_node

  arr = bst.opp_order_traversal()
  p arr.map {|e| e.value}
  arr[k - 1]
end
