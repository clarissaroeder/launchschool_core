=begin

---------------
PROBLEM
---------------
Write a method that takes an integer and returns the next larger featured number.

Input: Integer
Output: Integer
Rules:

A featured integer is:
- Odd
- A multiple of 7
- Each digit only occurs once

- If the input integer itself is a featured number, still return the next larger one.

ALGORITHM
---------------
- Find the next multiple of 7
  - A number is a multiple of 7 if % 7 returns 0
- Check if that number is a featured number
  - 
- If yes, return
- If not, add 7 and try again

---------------
NOTES:
- 
=end

def featured(num)
  return "There is no possible number that fulfills those requirements" if num > 9_876_543_210

  loop do 
    num = num + 1
    break if num  % 7 == 0
  end

  loop do
    break if num.odd? && num.to_s.chars.uniq == num.to_s.chars
    num += 7
  end

  num 
end

# Examples:
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
