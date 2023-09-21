=begin
---------------
PROBLEM
---------------
Restate: Write a method that determines whether a triangle is valid, and if so what kind of triangle, given the lengths of all three sides.

Input: Three numbers
Output: A symbol
Rules:
- A valid triangle fulfills the following conditions:
  - The sum of the two shortest sides is larger than the length of the longest side
  - All sides must have a length greater than 0

- Types of valid triangles are:
  - equilateral: all three sides are the same
  - isosceles: 2 sides of equal length, 3rd is different
  - scalene: all 3 sides have different lengths

ALGORITHM
---------------
- Check if the triangle is valid:
  - Place all sides in an array
  - Iterate over array and check if all inputs are greater than zero
    - If not, return invalid symbol
  - Check if the two smallest inputs added together are larger than the remaining input
    - Sort the array by size 
    - Add the last two items together
    - Compare that sum against the first item
      - If the sum is smaller than the first item, return an invalid symbol

- Check what type of triangle it is:
  - Check how many sides are of the same lengths:
    - Count how many instances of each element there are
      - If the count of the first element is equal to 3, the triangle has three equal sides
      - If the count of the first element is equal to 2, the triangle has two equal sides
      - If the count of the first element is equal to 1, check if the second element is in the array more then once:
        - If yes, then the triangle has two equal sides
        - If no, then the triangle has three different sides

---------------
NOTES:
- 

=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  case
  when sides.any? { |s| s <= 0 } || sides[-1] >= (sides[0] + sides[1]) 
    :invalid
  when  sides[0] == sides[1] && sides[1] == sides[2]
    :equilateral
  when sides[0] != sides[1] && sides[0] != sides[2] && sides[1] != sides[2]
    :scalene
  else
    :isosceles
  end
end

# Examples:
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
