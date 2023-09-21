class FixedArray
  def initialize(length)
    @array = [nil] * length
  end

  def [](idx)
    @array.fetch(idx)
  end

  def []=(idx, obj)
    self[idx]
    @array[idx] = obj
  end

  def to_a
    @array.clone
  end

  def to_s
    @array.to_s
  end
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil                            # true
puts fixed_array.to_a == [nil] * 5                    # true
puts

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'                            # true
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]    # true
puts

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'                            # true
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]    # true
puts

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'                            # true
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]    # true
puts

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'                            # true
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']    # true
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'  # false
puts

puts fixed_array[-1] == 'd'                           # true
puts fixed_array[-4] == 'c'                           # true
puts

begin                                                 # false
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin                                                 # true
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin                                                 # false
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end