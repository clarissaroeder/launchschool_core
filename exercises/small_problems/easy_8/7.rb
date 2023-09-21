=begin
Write a method that takes a string, and returns a new string in which every consonant character is doubled. 
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

ALGORITHM:
- Define an array of consonants
- Define an empty result string
- Iterate over input strings characters:
  - Append char to result times two if character it is included in consonants array
- Return result
=end

def double_consonants(string)
  consonants = ('a'..'z').to_a + ('A'..'Z').to_a - %w(a e i o u A E I O U)
  result = ''
  string.each_char do |c| 
    if consonants.include?(c)
    result << c * 2
    else 
      result << c
    end
  end
  result
end

# Examples:
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""