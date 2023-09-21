=begin
PROBLEM:
Write a method that takes one argument: an array of integers.
The method should return the minimum sum of 5 consecutive
numbers in the array. If the array contains fewer than 5
elements, the method should return nil.

- Input: Array
- Output: Integer

Rules:
- If the array size is smaller than 5, return nil
- Consecutive = by index, not numerically

DATA STRUCTURES:
- Subarrays of 5?

ALGORITHM:
- Create all possible subarrays of 5 consecutive elements
- Pick the one that sums to the smalles number and return

---------------
NOTES:
- To create subarrays of five, use #each_cons(5), or loop manually
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  subarrays = []
  arr.each_cons(5) { |sub| subarrays << sub }
  subarrays.min { |a, b| a.sum <=> b.sum }.sum
end


# Examples:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".