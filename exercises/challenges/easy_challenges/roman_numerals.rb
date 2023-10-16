class RomanNumeral
  attr_reader :number

  ROMAN_NUMERALS = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400, 'C' => 100, 'XC' => 90, 'L' => 50, 
                     'XL' => 40, 'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  def initialize(number)
    @number = number
  end

  def to_roman
    result = ''
    num = number

    ROMAN_NUMERALS.each_pair do |roman, decimal|
      if decimal <= num
        temp = (num / decimal)
        temp.times { result << roman }
        num -= temp * decimal
      end
    end
    
    result
  end
end