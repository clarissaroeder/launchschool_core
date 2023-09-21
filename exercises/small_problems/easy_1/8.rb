# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

def reversed_number(num)
  arr = []
  while num > 0
    arr << (num % 10)
    num = num / 10
  end

  arr.join.to_i
end

puts reversed_number(12345)
puts reversed_number(12213)
puts reversed_number(456)
puts reversed_number(12000)
puts reversed_number(12003)
puts reversed_number(1)