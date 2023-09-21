# The result of the following statement will be an error: 

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?
# Because `+` in this case is not an arithmetic operator, but used to concatenate strings. 40 + 2 however is an integer.
# To fix:

puts "the value of 40 + 2 is #{40 + 2}"
