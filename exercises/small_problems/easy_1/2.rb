# Write a method that takes one integer argument, which may be positive, negative, or zero. 
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd?(num)
  num.abs % 2 == 1
end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Rewrite using #remainder
def is_odd1?(num)
  num.abs.remainder(2) == 1
end

puts is_odd1?(2)    # => false
puts is_odd1?(5)    # => true
puts is_odd1?(-17)  # => true
puts is_odd1?(-8)   # => false
puts is_odd1?(0)    # => false
puts is_odd1?(7)    # => true