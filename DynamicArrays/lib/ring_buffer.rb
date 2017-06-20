require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0;
    @capacity = 8;
    @start_idx = 0;
  end

  # O(1)
  def [](index)
    raise ("index out of bounds") unless index < @length

    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    @store[(@start_idx + index) % @capacity] = val
  end

  # O(1)
  def pop
    raise ("index out of bounds") if @length == 0

    @length -= 1
    value = @store[(@start_idx + @length) % @capacity]
    value
  end

  # O(1) ammortized
  def push(val)
    resize! if @length + 1 > @capacity

    @store[(@start_idx + @length) % @capacity] = val
    @length += 1
  end

  # O(1)
  def shift
    raise("index out of bounds") if @length == 0

    value = @store[@start_idx]
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    value
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length + 1 > @capacity
    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)

    i = 0
    until i >= @length
      new_store[i] = @store[(@start_idx + i) % @capacity]
      i += 1
    end

    @capacity *= 2
    @start_idx = 0
    @store = new_store
  end
end
