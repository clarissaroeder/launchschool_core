=begin
Write a method that takes one argument, a string containing one or more words, and returns the given string 
with words that contain five or more characters reversed. Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.

ALGORITHM:
- Split string into array
- Iterate over array:
  - If a word is 5 characters or more, reverse that string
- Join array together with a space
- return
=end

def reverse_words(string)
  words = string.split.map do |word|
    if word.size >= 5
      word.reverse
    else 
      word
    end
  end
  words.join(" ")
end

# Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS