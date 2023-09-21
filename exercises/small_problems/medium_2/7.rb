=begin
---------------
PROBLEM
---------------
Write a method that calculates how many times in a year there was (or will be) a Friday, the 13th.

Input: Integer (representing a year)
Output: Integer

RULES:
- Assume the year is larger than 1752 (when UK adopted Gregorian Calendar)

ALGORITHM
---------------
- Define a constant for the day 
- Define a counter variable
- For each month in the year:
  - Create a Date object for the year given, the current month, and the DAY constant
  - Check whether that day is a friday
    - If yes, increment counter by one
- Return counter

---------------
NOTES:
- 

=end

require 'date'

DAY = 13

def friday_13th(year)
  counter = 0
  1.upto(12) { |month| counter += 1 if Date.new(year, month, DAY).friday? }
  counter
end


# Examples:
p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
