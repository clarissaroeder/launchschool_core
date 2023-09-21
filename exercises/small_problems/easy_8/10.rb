=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. 
The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

ALGORITHM:
- Iterate over array and keep a tally of sum all numbers
- Divide by size of array
- Return that value

=end

def average(arr)
  arr.reduce(:+) / arr.size.to_f
end

# Examples: 
puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40