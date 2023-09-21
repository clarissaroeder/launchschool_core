# Problem: Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
  # Input: array
  # Output: array
  # Running total = the sum of all values in a list up to and including the current element

# def running_total(arr)
#   running_total = 0
#   arr.map { |n| running_total += n }
# end

# def running_total(arr)
#   running_total = 0
#   arr.each_with_object([]) { |n, a| a << (running_total += n) }
# end

def running_total(arr)
  arr.inject([]) do |result, num|
    if result.empty?
      result << num 
    else
      result << (num + result.last)
    end
  end
end

# Examples:
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

# Data Structures: array for both input and output
# Algorithm: 
  # 1. Define running total variable and set to 0 initially
  # 2. Iterate over input array: add each element to the running total, return the running total to the result array
  # 3. Return result