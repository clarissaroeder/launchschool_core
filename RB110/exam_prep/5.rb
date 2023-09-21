=begin
PROBLEM:
Write a method that takes a string as an argument and returns the character that occurs least often in the given string.
If there are multiple characters with the equal lowest number of occurrences, then return the one that appears first in the
string. When counting characters, consider the uppercase and lowercase version to be the same.

- Input: String
- Output: Character

Rules:
- Case insensitive: count upper and lowercase alike
- If several characters appear equally often, return the one that appears earliest in the string
- Spaces count as characters

EXAMPLE:

DATA STRUCTURES:
- Hash to count occurences?

ALGORITHM:
- Define a counts hash
- Turn string into an array of characters
- Iterate over character array:
  - Add the character to the hash as key 
  - Increment count by 1 for each occurrence

- Return the key with the lowest value:
  - If there are several keys with the minimum value:
    - 


---------------
NOTES:
- 

=end

def least_common_char(string)
  counts = {}
  string.downcase.chars.each do |c| 
    counts.keys.include?(c) ? counts[c] += 1 : counts[c] = 1
  end
  
  least_frequent = counts.select { |k, v| v == counts.values.min }
  return least_frequent.key(counts.values.min) if least_frequent.size == 1
  
  string.downcase.each_char do |char|
    return char if least_frequent.keys.include?(char)
  end

end

# Examples:

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'

# The tests above should print "true".