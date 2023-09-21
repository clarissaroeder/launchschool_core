# Problem: Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.
# Input: Integer (positive)     Output: Array of digits

def digit_list(num)
  num.digits.reverse
end

# Examples: 
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

