class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1

    pivot = array.first
    left = array[1..-1].select { |el| el < pivot }
    right = array[1..-1].select { |el| el >= pivot }

    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1

    # pivot = rand(start...start + length - 1)
    # array[start], array[pivot] = array[pivot], array[start]

    pivot_idx = QuickSort.partition(array, start, length, &prc)

    QuickSort.sort2!(array, start, pivot_idx - start, &prc)
    QuickSort.sort2!(array, pivot_idx + 1, length - (pivot_idx + 1), &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}

    idx = start + 1
    pivot_idx = start + 1

    while idx < start + length
      if prc.call(array[idx], array[start]) == -1
        array[idx], array[pivot_idx] = array[pivot_idx], array[idx]
        pivot_idx += 1
      end

      idx += 1
    end
    pivot_idx -= 1
    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
