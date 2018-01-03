require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize(capacity = 8)
    @capacity = capacity
    @store = StaticArray.new(capacity)
    @length = 0

  end

  # O(1)
  def [](index)
    if index >= @length
      raise "index out of bounds"
    elsif index < 0
      raise "index out of bounds" if index < -(@length)
      return @store[@length + index]
    end

    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @store[@length - 1] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0

    new_store = []
    i = 0
    @store.each do |el|
      if i != 0
        new_store << el
      end
      i += 1
    end
    new_store << nil

    @store = new_store
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity

    new_store = [val]
    @store.each do |el|
      new_store << el
    end

    @length += 1
    @store = new_store
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    old_store = @store

    @capacity *= 2
    @store = StaticArray.new(@capacity)
    i = 0
    old_store.each do |el|
      @store[i] = el
      i += 1
    end

    @store
  end
end
