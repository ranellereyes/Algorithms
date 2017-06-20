class BSTNode
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end

  def children
    children = []
    children << @left unless @left.nil?
    children << @right unless @right.nil?
    children
  end
end
