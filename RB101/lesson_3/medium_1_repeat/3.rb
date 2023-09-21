def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1:
# To make sure only actual factors of the number get appended to the array, cause they will have a remainder of 0

# Bonus 2:
# To return the populated factors array