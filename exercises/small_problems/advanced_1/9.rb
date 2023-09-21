=begin

PROBLEM:
- Rational number = any number that can be represented as the result of a fraction (1/3, 2/4 etc.)
- Unit fraction = a rational number where the nominator is 1
- Egyption fraction = the sum of a series of distinct unit fractions (no denominator twice)
  -> Every positive rational number can be written as an Egyptian fraction in an **infinite** number of ways!

Write two methods:
- One that takes a Rational number, and returns an Array of the **denominators** that are part of an Egyptian fraction representation of the number
  - Input: a Rational(num, denom)
  - Output: an Array

- One that takes an Array of numbers (denominators) and returns the resulting Rational number
  - Input: Array
  - Output: Rational

Rules:
- 

EXAMPLE:
egyptian(2/1)    # -> [1, 2, 3, 6]
1/1 + 1/2 + 1/3 + 1/6 = 1 + 0.5 + 0.333.. + 0.166.. = 2

DATA STRUCTURES:
- Array
- Counter? (to track sum of egyptian fractions)

ALGORITHM:
Egyptian:
- Initialise a result array
- Initialise a sum variable
- Try out denominators, starting at 1:
  - Can 1/current_denom be part of the solution? 
    - Is sum + 1/current_denom smaller than the input Rational?
  - If yes, add the current denominator to the array
  - Add unit fraction to sum
  - If no, move on to the next denom
- Terminate if sum is equal to input Rational

Unegyptian:
- Given a list of denominators, make unit fractions out of every one:
  - Define a sum variable
  - Loop over input array
  - Add 1/current_element to the sum
- Return sum as a rational

---------------
NOTES:
- Rational class: #denominator/#numerator

=end

require 'pry'

def egyptian(rat)
  result = []
  sum = 0
  current_denom = 1

  loop do
    if (sum + Rational(1, current_denom)) <= rat
      result << current_denom
      sum += Rational(1, current_denom)
    end
    current_denom += 1
    break if sum == rat
  end

  result
end

def unegyptian(arr)
  arr.reduce(0) { |sum, denom| sum += Rational(1, denom) }
end

# Examples
p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)