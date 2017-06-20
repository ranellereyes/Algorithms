class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    prc ||= Proc.new { |a,b| a - b }
  end

  def count
    @store.count
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    val = @store.pop
    BinaryMinHeap::heapify_down(@store, 0)
    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap::heapify_up(@store, @store.count - 1)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    children << 2 * parent_index + 1
    children << 2 * parent_index + 2
    children.select { |e| e < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    require 'byebug'
    prc ||= Proc.new { |a,b| a - b}

    until parent_idx == len
      children = self.child_indices(len, parent_idx)
      if children.length == 2
        min = prc.call(array[children[0]], array[children[1]]) > 0 ?
                children[1] : children[0]
          if prc.call(array[parent_idx], array[min]) > 0
            array[parent_idx], array[min] =
              array[min], array[parent_idx]
          end
      elsif children.length == 1
        if prc.call(array[parent_idx], array[children[0]]) > 0
          array[parent_idx], array[children[0]] =
            array[children[0]], array[parent_idx]
        end
      end
        parent_idx += 1
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |a,b| a - b}

    until child_idx == 0
      par_idx = self.parent_index(child_idx)
      if prc.call(array[par_idx], array[child_idx]) > 0
        array[par_idx], array[child_idx] =
          array[child_idx], array[par_idx]
        child_idx = par_idx
      else
        break
      end
    end

    array
  end
end
