# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(num)
 num.to_s.chars.reduce(0) { |sum, n| sum + (n.to_i) }
end

# Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45