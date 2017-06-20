require_relative "heap"

class Array
  def heap_sort!
    i = 1
    arr = self
    while i < arr.length
      arr = BinaryMinHeap::heapify_up(arr, i, i + 1)
      i += 1
    end
    # j = arr.length - 1
    # while j >= 0
    #   arr[j], arr[0] = arr[0], arr[j]
    #   arr = BinaryMinHeap::heapify_down(arr, 0, j)
    #   j -= 1
    # end

    j = 1
    while j < arr.length
      p arr
      arr = BinaryMinHeap::heapify_down(arr, j)
      p arr
      j += 1
    end

    arr
  end
end
