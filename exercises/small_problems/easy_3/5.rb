# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

puts square(8) == 64
puts square(-8) == 64