class Scrabble
  attr_reader :word

  def initialize(string)
    @word = string ? string : ''
  end

  def score
    result = 0
    word.downcase.chars.each do |letter|
      result += determine_value(letter)
    end
    result
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  private

  def determine_value(letter)
    case
    when letter.match?(/[aeioulnrst]/) then 1
    when letter.match?(/[dg]/) then 2
    when letter.match?(/[bcmp]/) then 3
    when letter.match?(/[fhvwy]/) then 4
    when letter.match?(/k/) then 5
    when letter.match?(/[jx]/) then 8
    when letter.match?(/[qz]/) then 10
    else
      0
    end
  end
end