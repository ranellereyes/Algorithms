class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev, self.next = nil, nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next, @tail.prev = @tail, @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    return nil if empty?

    @head.next
  end

  def last
    return nil if empty?

    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each { |node| return node.val if node.key == key }
    nil
  end

  def include?(key)
    self.any? { |node| node.key == key}
  end

  def append(key, val)
    appendage = Node.new(key, val)

    appendage.prev = @tail.prev
    @tail.prev.next = appendage
    @tail.prev = appendage
    appendage.next = @tail

    appendage
  end

  def update(key, val)
    self.each { |node| node.val = val if node.key == key }
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.remove
        return node.val
      end
    end
  end

  def each
    curr_node = @head.next
    until curr_node == @tail
      yield curr_node
      curr_node = curr_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
