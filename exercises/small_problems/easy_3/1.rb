# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

numbers = []

puts "==> Enter the 1st number:"
numbers[0] = gets.to_i
puts "==> Enter the 2nd number:"
numbers[1] = gets.to_i
puts "==> Enter the 3rd number:"
numbers[2] = gets.to_i
puts "==> Enter the 4th number:"
numbers[3] = gets.to_i
puts "==> Enter the 5th number:"
numbers[4] = gets.to_i
puts "==> Enter the last number:"
num = gets.to_i

if numbers.include?(num)
  puts "The number #{num} appears in #{numbers}."
else
  puts "The number #{num} does not appear in #{numbers}."
end

