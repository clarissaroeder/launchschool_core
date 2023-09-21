=begin 
PROBLEM
---------------
RESTATE: Write a method that takes an array as an argument, and returns the same array object but with all its elements in reverse order.
INPUT: Array
OUTPUT: The same array
RULES: 
- You may not use Array#reverse or Array#reverse!
- An empty array as input should output an empty array
- In case of single element arrays, do not reverse letters or digit of the element

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: Array
INBETWEEN: Buffer variable? Copy of the array?
OUTPUT: Array
NOTES: 
- pop/unshift
- 

ALGORITHM
---------------
REMINDERS:
HIGHER LEVEL: 
- Create countup and countdown variable to 0 and length of array minus 1 respectively
- Loop a set number of times: size of the input array divided by 2
  - Create a buffer variable
  - Swap the countupth and countdownth variables using the buffer
  - Increment countup and decrement countdown by 1


=end

def reverse!(arr)
  up = 0
  down = -1

  (arr.size / 2).times do
    arr[up], arr[down] = arr[down], arr[up]
  
    up += 1
    down -= 1
  end

  arr
end

# Examples:
list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true