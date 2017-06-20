# Given a sorted array consisting of only integers where every element appears twice except for one element which appears once.
# Find this single element that appears only once. Do it in O(logn) time and O(1) space

def single_in_sorted(arr)
  return arr[0] if arr.length == 1
  mid = arr.length / 2
  mid -= 1 if mid.odd?

  if arr[mid] == arr[mid + 1]
    return single_in_sorted(arr[0..mid])
  else
    return single_in_sorted(arr[mid + 1..-1])
  end
end

p single_in_sorted([1,1,2,2,3,3,4])
