=begin
---------------
PROBLEM
---------------
Restate: Write a method that takes a triangles three angles as argument, and checks the triangle for validity and type.

Input: Three integers
Output: Symbol
Rules:

Invalid triangles:
  - the sum of all angles must be 180 exact
  - all angles must be greater than 0

Types of triangle:
  right: One angle of the triangle is a right angle (90 degrees)
  acute: All 3 angles of the triangle are less than 90 degrees
  obtuse: One angle is greater than 90 degrees.

ALGORITHM
---------------
- 

---------------
NOTES:
- 


=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case 
  when angles.include?(0)|| angles.sum != 180
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |a| a < 90 }
    :acute
  else
    :obtuse
  end

end

# Examples:
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid