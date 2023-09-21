# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. 
# Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The same object (reverse! is mutating)
# Actual answer: different object; when we use #split it's already a different object, 
# this array is then mutated inside the block, but when #join is applied it returns a completely new string