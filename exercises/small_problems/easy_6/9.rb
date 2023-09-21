=begin 
PROBLEM
---------------
RESTATE: Write a method that takes an array and a search value as arguments, and returns true if the array contains said search value.
INPUT: Array, search value (can be any object?)
OUTPUT: Boolean
RULES:
- #include? is not allowed
- If the array is empty, the method should return false
- The method should be able to work with nil as an element and search value:
  - If the array contains nil, and the search value is nil, the method should return true
  - If the array is empty, and the search value is nil, the method should return false

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: Array, search value (any object)
INBETWEEN:
OUTPUT: Boolean
NOTES: count

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL:
- Count the number of times the search value appears in the array
- If the result is 0, return false
- Else return true
=end

def include?(arr, val)
  arr.count(val) > 0 ? true : false
end

# Examples:
p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false