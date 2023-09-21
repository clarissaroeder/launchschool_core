=begin
Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.

The Fibonacci series is a sequence of numbers starting with 1 and 1 where each number is the sum of the two previous numbers: 
the 3rd Fibonacci number is 1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on. In mathematical terms:

F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

---------------
PROBLEM
---------------
Restate: Given an integer n, write a method that calculates the nth number in the Fibonacci sequence.
Input: Integer
Output: Integer
Rules:
  - The first two numbers in the sequence are 1
  - From the third number on the numbers are calculated as: f(n) = f(n - 1) + f(n - 2)
  - The method must be recursive:
    - It calls itself at least once
    - It has a base condition that stops the recursion
    - It uses the result returned by itself

EXAMPLE
---------------
fib sequence: 1 1 2 3 5 

fibonacci(5) == 5

fibonacci(5) = fibonacci(4) + fibonacci(3)
fibonacci(4) = fibonacci(3) + fibonacci(2)
fibonacci(3) = fibonacci(2) + fibonacci(1)

fibonacci(1) == 1
fibonacci(2) == 1

ALGORITHM
---------------
- Compute fibonacci value at nth position:
  - Call method itself on nth - 1 and nth - 2 positions
  - Add these return values together
  - Define base conditions to stop recursion
    - If n is either 1 or 2, return 1
- Return the result 

NOTES
---------------
Base cases:
  - n == 1 -> return 1
  - n == 2 -> return 1

Recursion:
  - To get result of fibonacci(n), method calls itself on f(n-1) and f(n-2) and adds the sum together

=end

def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end


# Examples:
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765