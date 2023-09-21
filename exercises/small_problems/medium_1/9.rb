=begin
Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.
Rewrite your recursive fibonacci method so that it computes its results without recursion.

PROBLEM
---------------
Restate: Write a method that computes the nth value of the fibonacci sequence procedurally
Input: Integer
Output: Integer
Rules:

EXAMPLE
---------------
fibonacci(5)

first = 1
second = 1

third = first + second = 2
fourth = second + third = 3
fifth = third + fourth = 5
fifth ==  5 -> break


ALGORITHM
---------------
- Define the tail of the sequence
- Until the index as defined by the input integer n is reached, add the previous two numbers together
  - Add previous two numbers together and add to the sequence
- Return last sum computed

---------------
NOTES:
- 

=end

def fibonacci(n)
  first, last = [1, 1]

  3.upto(n) do
    first, last = [last, last + first]
  end

  last
end

# Examples:
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501