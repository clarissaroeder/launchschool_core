# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine 
# the sum or product of all numbers between 1 and the entered integer.

num = 0;
loop do
  puts ">> Please enter an integer greater than 0:"
  num = gets.to_i

  if num > 0
    break
  end
end

operation = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp

  if operation == 's' || operation == 'p'
    break
  end
end

range = (1..num).to_a

if operation == 's'
  sum = range.sum
  puts "The sum of the integers between 1 and #{num} is #{sum}."
else
  product = range.product
  puts "The product of the integers between 1 and #{num} is #{product}"
end