class CircularQueue
  attr_accessor :buffer, :oldest_idx, :next_idx, :capacity

  def initialize(size)
    @buffer = Array.new(size)
    @capacity = size
    @oldest_idx = 0
    @next_idx = 0
  end

  def enqueue(obj)
    # in case of replacement: move oldest index along
    unless buffer[next_idx].nil?
      self.oldest_idx = increment(oldest_idx)
    end

    buffer[next_idx] = obj
    self.next_idx = increment(next_idx)
  end

  def dequeue
    obj = buffer[oldest_idx]
    buffer[oldest_idx] = nil
    self.oldest_idx = increment(oldest_idx) unless obj.nil?
    obj
  end

  def increment(position)
    (position + 1) % capacity
  end

  def to_s
    @buffer.to_s
  end
end

# Tests
queue = CircularQueue.new(3)
puts queue.dequeue == nil     # true

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1       # true#
puts

queue.enqueue(3)
queue.enqueue(4)               # is placed in wrong place
puts queue.dequeue  == 2       # false
puts 

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5       # false
puts queue.dequeue == 6       # false
puts queue.dequeue == 7       # false
puts queue.dequeue == nil     # true
puts

queue = CircularQueue.new(4)
puts queue.dequeue == nil     # true
puts 

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1       # true
puts

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2       # true
puts

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4       # true
puts queue.dequeue == 5       # true
puts queue.dequeue == 6       # false
puts queue.dequeue == 7       # false
puts queue.dequeue == nil     # true
