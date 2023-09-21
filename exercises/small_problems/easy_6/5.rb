=begin 
PROBLEM
---------------
RESTATE: Write a method that takes an array as input and returns a new array with the elements of the original array in reverse order.
INPUT:
OUTPUT:
RULES:
- You may not use Array#reverse or #reverse!
- You may not use the method you wrote in the previous exercise

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: Array
INBETWEEN: Empty array that gets populated from original
OUTPUT: New array
NOTES: 

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL: 
- Create a new result array
- Set an index variable to -1
- Loop a number of times: as often as input array has elements
  - Append the element of the original array at the current index to the result array
  - Decrement index by -1

- Return result array
=end

def reverse(arr)
  result = []
  idx = -1

  arr.size.times do
    result << arr[idx]
    idx -= 1
  end

  result
end

# Examples
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true