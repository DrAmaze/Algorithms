require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize(capacity = 8)
    @capacity = capacity
    @store = StaticArray.new(@capacity)
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    if index >= @length
      raise "index out of bounds"
    elsif index < 0
      raise "index out of bounds" if index < -(@length)
      return @store[(@length + index + @start_idx) % @capacity]
    end

    @store[(@start_idx + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    raise "index out of bounds" if index >= @length
    @store[(index + @start_idx) % @capacity] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    last_item = @store[(@length + @start_idx - 1) % @capacity]
    @store[(@length + @start_idx - 1) % @capacity] = nil
    @length -= 1
    last_item
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @store[(@length + @start_idx) % @capacity] = val
    @length += 1
    self
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length == 0
    first_item = @store[@start_idx]
    @store[@start_idx] = nil
    @start_idx = (@start_idx + 1) % capacity
    @length -= 1
    first_item
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @start_idx = (@start_idx - 1) % capacity
    @store[@start_idx] = val
    @length += 1
    self
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    @capacity *= 2
    new_store = StaticArray.new(@capacity)

    i = 0
    @store.each do |el|
      new_store[i] = @store[(@start_idx + i) % (@capacity / 2)]
      i += 1
    end

    @store = new_store
    @start_idx = 0
  end
end
