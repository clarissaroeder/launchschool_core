=begin
PROBLEM:
Write a method named to_weird_case that accepts a string, and
returns the same sequence of characters with every 2nd character
in every third word converted to uppercase. Other characters
should remain the same.

- Input: string
- Output: same string

ALGORITHM:
- Identify every third word
- Turn every second letter in these words into uppercase

- Split string into an array of words
- Iterate over the words array:
  - If 

---------------
NOTES:
=end

def to_weird_case(string)
  words = string.split
  result = []

  words.each_with_index do |word, idx|
    if (idx + 1) % 3 == 0
      new_word = ''
      word.chars.each_with_index do |char, idx|
        idx.even? ? new_word << char : new_word << char.upcase
      end
      result << new_word
    else
      result << word
    end
  end

  result.join(' ')
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c')  == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".
