=begin
Write a method that takes an integer as argument, and returns the maximum rotation of that argument. 
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

ALGORITHM:
- Determine number of digits and save into variable n
- While n is larger than 1
   - Call rightmost digit method on number, n
   - Update number
   - Decrement n by 1

=end
require 'pry'

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_array = num.to_s.chars
  num_array[-n..-1] = rotate_array(num_array[-n..-1])
  num_array.join.to_i
end

def max_rotation(num)
  n = num.to_s.size
  while n > 1
    num = rotate_rightmost_digits(num, n)
    n -= 1
  end
  num
end

# Examples:
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845