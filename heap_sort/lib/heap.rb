class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    prc ||= Proc.new {|x, y| x <=> y }
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    removal = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, &@prc)
    removal
  end

  def peek
    @store.first
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length - 1, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    children = []
    if 2 * parent_index + 1 < len
      children << 2 * parent_index + 1
      if 2 * parent_index + 2 < len
        children << 2 * parent_index + 2
      end
    end
    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0

    child_index % 2 == 0 ? (child_index / 2 - 1) : (child_index / 2)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    heaped = false
    until heaped || self.child_indices(len, parent_idx).empty?
      heaped = true
      ch1_idx, ch2_idx = self.child_indices(len, parent_idx)
      ch2_idx = false unless ch2_idx

      if ch2_idx == false || prc.call(array[ch1_idx], array[ch2_idx]) <= 0
        if prc.call(array[parent_idx], array[ch1_idx]) == 1
          array[parent_idx], array[ch1_idx] = array[ch1_idx], array[parent_idx]
          parent_idx = ch1_idx
          heaped = false
        end
      else
        if prc.call(array[parent_idx], array[ch2_idx]) == 1
          array[parent_idx], array[ch2_idx] = array[ch2_idx], array[parent_idx]
          parent_idx = ch2_idx
          heaped = false
        end
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }

    heaped = false
    until heaped || child_idx == 0
      heaped = true
      parent_idx = self.parent_index(child_idx)

      if prc.call(array[child_idx], array[parent_idx]) == -1
        array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
        child_idx = parent_idx
        heaped = false
      end
    end

    array
  end
end
