=begin 
PROBLEM
---------------
RESTATE: Write a method that takes two arrays as arguments, and returns a new array with elements alternating from each of the input arrays
INPUT: Two arrays
OUTPUT: One array
RULES:
- Assume arrays are non-empty 
- Assume arrays contain same number of elements
- Elements: should their value or their reference be copied?

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT:
INBETWEEN:
OUTPUT:
NOTES: 

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL:
- Create result array
- Create counter variable
- Loop the same numer of times as size of the input arrays
  - Add element at index counter of array 1 to result
  - Add element at index counter of array 2 to result
  - Increment counter by 1
- Return result
=end

# def interleave(arr1, arr2)
#   result = []
#   i = 0
#   arr1.size.times do 
#     result << arr1[i]
#     result << arr2[i]
#     i += 1
#   end
#   result
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

# Examples:
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']