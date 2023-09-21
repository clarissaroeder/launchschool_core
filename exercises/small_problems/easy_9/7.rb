=begin
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'

ALGORITHM:
- Calculate average: sum all scores together and divide by 3
- Case statement:

=end

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  case average
  when (101..) then "A+"
  when (90..100) then 'A'
  when (80..89)	then 'B'
  when (70..79) then 'C'
  when (60..69) then	'D'
  when (0..59) then 'F'
  end
end

# Examples
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(95, 115, 97) == "A+"
