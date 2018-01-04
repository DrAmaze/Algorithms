require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new {|x, y| y <=> x}
  array.each { |n| heap.push(n) }

  largest = []
  until largest.length == k
    largest << heap.extract
  end
  largest
end
