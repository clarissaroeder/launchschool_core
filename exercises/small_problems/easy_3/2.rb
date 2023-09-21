# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: 
# addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

puts "==> Enter the first number:"
num1 = gets.to_i

puts "==> Enter the second number:"
num2 = gets.to_i

sum = num1 + num2
diff = num1 - num2
product = num1 * num2
quotient = num1 / num2
remainder = num1 % num2
power = num1 ** num2

puts "==> #{num1} + #{num2} = #{sum}"
puts "==> #{num1} - #{num2} = #{diff}"
puts "==> #{num1} * #{num2} = #{product}"
puts "==> #{num1} / #{num2} = #{quotient}"
puts "==> #{num1} % #{num2} = #{remainder}"
puts "==> #{num1} ** #{num2} = #{power}"