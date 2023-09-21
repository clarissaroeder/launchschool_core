# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def repeat(string, num)
  if num < 0
    puts "Can't perform negative repititions."
  else
    num.times { puts string }
  end
end

repeat('Hello', 3)