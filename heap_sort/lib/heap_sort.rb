require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new { |x, y| y <=> x }
    self.each { |n| heap.push(n) }

    i = 0
    while heap.count > 0
      self[i] = heap.extract
      i += 1
    end
    self.reverse!
  end
end
