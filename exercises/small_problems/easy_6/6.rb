=begin 
PROBLEM
---------------
RESTATE: Write a method that merges two arrays into a single array, and returns that array with all duplicate values removed 
INPUT: two arrays
OUTPUT: one array
RULES: duplicate values need to be removed from the result array 

- do the numbers have to be in numerical order or are they in the order first array, then second array?

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: two arrays
INBETWEEN:
OUTPUT: one array
NOTES: flatten!, uniq!

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL: 
- Create result array 
- Iterate over input array 1:
  - Append each element to result
- Iterate over input array 2:
  - Append each element to result
- Remove duplicates
- Sort in order?
- Return

=end

# def merge(arr1, arr2)
#   result = []
#   arr1.each { |num| result << num }
#   arr2.each { |num| result << num }
#   result.uniq!
# end

def merge(arr1, arr2)
  p arr1 + arr2
  (arr1 + arr2).uniq
end

# def merge(arr1, arr2)
#   arr1 | arr2
# end

# Examples:
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]