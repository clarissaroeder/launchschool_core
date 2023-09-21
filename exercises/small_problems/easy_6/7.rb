=begin 
PROBLEM
---------------
RESTATE: Write a method that takes an arrays as input, and returns an array with two inner arrays as elements, each containing half of the elements of the original array.
INPUT: Array
OUTPUT: Nested array
RULES:
- First inner array should contain first half of elements, second should contain second
- If number of elements is odd, the middle element should go into the first array
- An empty input array should return an array with two nested empty arrays

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: Array
INBETWEEN: Two arrays
OUTPUT: Nested array
NOTES: partition

ALGORITHM
---------------
REMINDERS: 
HIGHER LEVEL: 
- Split input array in two parts: 
  - If size of array is even:
    - Sort elements into first array if their index is less than the number of elements divided by 2
  - If size of array is odd:
    - Sort elements into first array if their index is less than the number of elements divided by 2 + 1
=end

def halvsies(arr)
  cutoff = (arr.size / 2.0).ceil
  arr.partition { |num| arr.index(num) < cutoff }
end


# Examples:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]