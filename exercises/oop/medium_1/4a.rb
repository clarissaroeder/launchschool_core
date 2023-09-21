class CircularQueue
  attr_accessor :buffer, :capacity, :max_idx

  def initialize(size)
    @buffer = []
    @capacity = size
  end

  def enqueue(obj)
    buffer.shift if buffer.size == capacity
    buffer.push(obj)
  end

  def dequeue
      buffer.shift
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
queue.enqueue(4)               
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
