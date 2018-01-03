# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize(capacity = 8)
    @capacity = capacity
    @store = RingBuffer.new(@capacity)
    @max_idx = 0
  end

  def enqueue(val)
    @store.push(val)
    if val > @store[@max_idx]
      @max_idx = @store.length - 1
    end
  end

  def dequeue
    @store.shift
    @max_idx -= 1
    if length != 0 && max == nil 
      @max_idx = 0
      max = @store[@max_idx]
      i = 0
      each do |el|
        if el > max
          max = el
          @max_idx = i
        end
        i += 1
      end
    end
  end

  def max
    @store[@max_idx]
  end

  def length
    @store.length
  end

  def each
    length.times { |i| yield @store[i] }
    self
  end

end
