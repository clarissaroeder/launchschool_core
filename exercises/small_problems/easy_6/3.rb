=begin
PROBLEM
---------------
RESTATE: Write a method that takes an integer as argument and returns the index of the first number in the Fibonacci sequence that has the number of digits specified by the argument.
INPUT: Positive Integer >= 2
OUTPUT: Positive Integer (an index)
RULES: 
- Assume input is always greater than or equal to 2
- The first Fibonacci number is at index 1 (not 0)

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: integer
INBETWEEN: array?
OUTPUT: integer
NOTES: 

ALGORITHM
---------------
REMINDERS: first fibonacci number is at index 1
HIGHER LEVEL: 
- Dynamically create an array with the fibonacci sequence, up until it reaches numbers that have the specified amount of digits
  - Define first and second number of the sequence as variables
  - Place variables in an array
  - Loop until the specified digits are reached:
    - Add a new number to the array that is the sum of last plus next to last element
    - Check if that sum has the desired amount of digits
    - If yes:
      - Terminate the loop
      - Get the index of that sum and add 1
      - Return index


LOWER LEVEL:
=end


def find_fibonacci_index_by_length(num)
  first = 1
  second = 1
  fibonacci = [first, second]

  loop do 
    fibonacci << fibonacci[-1] + fibonacci[-2]
    return fibonacci.size if fibonacci[-1].to_s.size == num
  end
end

# Examples:
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
