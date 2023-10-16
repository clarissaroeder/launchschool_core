class Anagram
  def initialize(string)
    @original = string.downcase
  end

  # Anagrams are case-insensitive, identical words are not anagrams
  # Same length, same characters, same 
  def match(array)
    result = []

    array.each do |word|
      next if word.downcase == @original
      result << word if is_anagram?(word.downcase)
    end

    result
  end

  def is_anagram?(word)
    word.chars.sort == @original.chars.sort
  end
end