=begin
PROBLEM:
Write a method that takes an array of integers and returns the two numbers that are closest together in value.

- Input: Array
- Output: Array (2 numbers)

Rules:
- Numbers don't have to be consecutive

EXAMPLE:
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27] 
27 - 25 = 2 
19 - 16 = 3 etc..

DATA STRUCTURES:


ALGORITHM:
- Subtract each number from each number
- Pick the pair with the smallest absolute difference

- From first to second to last element, do:
  - Subtract all remaining elements from the current element: current + 1 until last
  - On first iteration: save the difference in a variable
  - On every other iteration: compare current difference with saved difference
    - If current difference is smaller:
      - Save numbers in result array


- Return the result array

---------------
NOTES:
- #abs

=end

def closest_numbers(array)
  result = []
  diff = 0

  0.upto(array.length - 2) do |i|
    (i + 1).upto(array.length - 1) do |j|
      if result.empty?
        result = [array[i], array[j]]
        diff = (array[i] - array[j]).abs
      elsif (array[i] - array[j]).abs < diff
        result = [array[i], array[j]]
        diff = (array[i] - array[j]).abs
      end
    end
  end

  result
end

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".