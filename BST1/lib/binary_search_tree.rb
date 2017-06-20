# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require "bst_node"
require "byebug"

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value, tree_node = @root)
    return @root = BSTNode.new(value) if @root.nil?

    if value <= tree_node.value
      tree_node.left.nil? ?
        tree_node.left = BSTNode.new(value) :
        insert(value, tree_node.left)
    else
      tree_node.right.nil? ?
        tree_node.right = BSTNode.new(value) :
        insert(value, tree_node.right)
    end
  end

  def find(value, tree_node = @root)
    return tree_node if value == tree_node.value

    if value <= tree_node.value
      return tree_node.left.nil? ?
        nil :
        find(value, tree_node.left)
    else
      return tree_node.right.nil? ?
        nil :
        find(value, tree_node.right)
    end
  end

  def delete(value)
    return @root = nil if @root.value == value
    parent = find_parent_node(value)

    delete_child(parent, value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?

    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || tree_node.children.length == 0

    return [depth(tree_node.left), depth(tree_node.right)].max + 1
  end

  def is_balanced?(tree_node = @root)
    return true if tree_node.nil? || tree_node.children.length == 0
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1

    if is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
      return true
    else
      return false
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return nil if tree_node.nil?
    return tree_node.value if tree_node.children.empty?

    arr << in_order_traversal(tree_node.left)
    arr << tree_node.value
    arr << in_order_traversal(tree_node.right)

    return arr.flatten.reject { |e| e.nil? }
  end

  def opp_order_traversal(tree_node = @root, arr = [])
    return nil if tree_node.nil?
    return tree_node if tree_node.children.empty?

    arr << opp_order_traversal(tree_node.right)
    arr << tree_node
    arr << opp_order_traversal(tree_node.left)

    return arr.flatten.reject { |e| e.nil? }
  end

  private
  # optional helper methods go here:
  def find_parent_node(value, parent = @root)
    return parent if parent.children.map {|n| n.value }.include?(value)

    if value <= parent.value
      return parent.left.nil? ?
        nil :
        find_parent_node(value, parent.left)
    else
      return parent.right.nil? ?
        nil :
        find_parent_node(value, parent.right)
    end
  end

  def delete_child(parent, value)
    child = value <= parent.value ?
              parent.left : parent.right

    if child.children.length == 0
      value <= parent.value ?
        parent.left = nil :
        parent.right = nil
    elsif child.children.length == 1
      value <= parent.value ?
        parent.left = child.children[0] :
        parent.right = child.children[0]
    else
      replacement = maximum(child.left)
      if value <= parent.value
        parent.left = replacement
        max_parent = find_parent_node(replacement.value)
        max_parent.right = replacement.left
        replacement.left = nil
      else
        parent.right = replacement
        max_parent = find_parent_node(replacement.value)
        max_parent.right = replacement.left
        replacement.left = nil
      end
    end
  end
end
