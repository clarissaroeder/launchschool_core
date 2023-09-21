=begin
Write a method that computes the difference between the square of the sum of the first 
n positive integers and the sum of the squares of the first n positive integers.

- Positive:
  - From 1 up until n: add all integers together and square that sum
- Negative:
  - From 1 up until n: square each integer and add the squares together
- Subtract negative from positive

- Define a positive sum squared variable
- Define a negative sum of squares variable

=end

def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |i|
    sum += i
    sum_of_squares += (i**2)
  end

  sum**2 - sum_of_squares
end

# Examples:
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150