# Problem: Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
# Input: a string       Output: a hash with keys = integer that shows length of word, value = integer that shows how many words of that length there are
# Words are any character sequences that don't include a space, i.e., words are space separated

def word_sizes(string)
  string.split.each_with_object({}) { |word, result| result.keys.include?(word.length) ? result[word.length] += 1 : result[word.length] = 1 }
end

# Examples:
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# Algorithm:
# 1. Define empty result hash 
# 2. Turn input string into an array of strings
# 3. Sort array by word length
# 4. Iterate over the array and determine word length of each element
  # 5. Save length as key in result hash with value 1 if that key does not yet exist
  # 6. If that key exists already, update value by +1
# 7. Return result
  