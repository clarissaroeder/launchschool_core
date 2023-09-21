=begin
Write a method that returns the next to last word in the String passed to it as an argument.
Words are any sequence of non-blank characters.
You may assume that the input String will always contain at least two words.

ALGORITHM:
- Turn string into array of words
- Return element at -2 index
=end

# def penultimate(string)
#   words = string.split
#   words[-2]
# end

# # Examples:
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

=begin
Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: 
strings that contain just one word, and strings that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? 
How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. 
It should handle all of the edge cases you thought of.

Edge cases:
- Even number of words: middle two?
- One word: return that
- No words: return empty string

ALGORITHM:
- Turn string into array of elements
- Check array size: 
  - If odd:
    - Return element at index size divided by 2
  - If even: 
    - Return element at index size divided by 2 and at size divided by 2 - 1
  

=end

def middle(string)
  words = string.split
  if words.empty?
    ''
  elsif words.size.odd?
    words[words.size / 2]
  else
    words[(words.size / 2 - 1), 2].join(" ")
  end
end

# Examples:
p middle('last word') == 'last word'
p middle('Launch School is great!') == 'School is'
p middle('This is a sentence example') == 'a'
p middle('Penguin') == 'Penguin'
p middle('') == ''
