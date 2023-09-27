=begin
Write a method called drop_while that behaves similarly for Arrays. 
It should take an Array as an argument, and a block. It should return all 
the elements of the Array, except those elements at the beginning of the 
Array that produce a truthy value when passed to the block.

If the Array is empty, or if the block returns a truthy value for every element, 
drop_while should return an empty Array.

Your method may use #each, #each_with_object, #each_with_index, #reduce, loop, 
for, while, or until to iterate through the Array passed in as an argument, 
but must not use any other methods that iterate through an Array or any other collection.
=end

def drop_while(array)
  drop = true
  array.each_with_object([]) do |value, result|
    drop = false if !yield(value)

    result << value if drop == false
  end
end

# Examples
p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []