# Problem: Given a string of some lowercased words and non-alphabetical characters, write a method that returns that string with all of the 
# non-alphabetic characters replaced by spaces.
# Input: string     Output: string ?? the same or new object ??
# Explicit: turn all non-alphabetic characters into spaces. 
  # If there's more than one non-alphabetical character, there should still only be one space (no consecutive spaces in the output)
# You may assume all letters are lowercased

ALPHABET = ('a'..'z').to_a

def cleanup(string)
  string.chars.map { |c| ALPHABET.include?(c) ? c : c = ' ' }.join.squeeze(' ')
end

# Examples: 
p cleanup("---what's my +*& line?") == ' what s my line '

# Algorithm:
# 1. Define alphabet array constant
# 2. Loop over each character in the string: is it included in alphabet?
  # If yes, leave as is
  # If no, replace with space
# 3. Clean up spaces: replace consecutive spaces by only one