require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise("index out of bounds") if index > @length - 1

    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise("index out of bounds") if index > @length - 1

    @store[index] = value
  end

  # O(1)
  def pop
    raise("index out of bounds") if @length == 0

    @store[@length] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    resize! if @length > @capacity
    @store[@length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise("index out of bounds") if @length == 0

    i = 0

    until (i > (@length - 1))
      @store[i] = @store[i + 1]
      i += 1
    end

    @store[@length] = nil
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    i = @length
    resize! if @length + 1 > @capacity
    @length += 1

    until i < 1
      @store[i] = @store[i - 1]
      i -= 1
    end

    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2)

    i = 0
    until i >= @length
      new_store[i] = @store[i]
      i += 1
    end

    @capacity *= 2
    @store = new_store
  end
end
