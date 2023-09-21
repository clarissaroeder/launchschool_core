# Write another method that returns true if the string passed as an argument is a palindrome, false otherwise. 
# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters.

def real_palindrome?(string)
  string = string.downcase.delete('/^a-z0-9/')
  string == string.reverse
end

puts real_palindrome?('madam') 
puts real_palindrome?('Madam') 
puts real_palindrome?("madam i'm adam") 
puts real_palindrome?('356653')