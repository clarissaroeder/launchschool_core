=begin 
PROBLEM
---------------
RESTATE: A method that takes a String and returns a new titleized String 
INPUT: String
OUTPUT: String
RULES: - Assume any sequence of non-blank characters are words
- Quoted words ("word") should remain as they are

EXAMPLES
---------------

DATA STRUCTURES
---------------
INPUT: String
INBETWEEN: Array
OUTPUT: String
NOTES: 

ALGORITHM
---------------
REMINDERS: quoted words untouched
HIGHER LEVEL:
- Split string into an array of words
- Iterate over array and capitalise each word unless its quoted
- Join array together into a string with spaces separating each word
- Return that string
=end

# def word_cap(string)
#   string.split.map { |word| word.capitalize }.join(" ")
# end

# def word_cap(string)
#   string.split.map do |word|
#     chars = word.downcase.chars
#     chars[0] = chars[0].upcase
#     chars.join
#   end.join(" ")
# end

def word_cap(string)
  result = ''
  string.downcase.split.each do |word| 
    result << word[0].upcase + word[1, word.size - 1] + " "
  end
  result.chop
end


# Examples:
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'