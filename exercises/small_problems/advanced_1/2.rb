=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. 
The smallest such star you need to handle is a 7x7 grid.

Rules: n is always odd!

Notes:
- Middle line has n stars
- Top and bottom rows consist of 3 stars each, with varying number of spaces
  - Spaces are determined by n:
    - Top and bottom row are as wide as middle (n) -> n - 3 spaces, (n-3)/2 spaces inbetween each star
    - Each row below has one less space between the stars
    - Until the last row before the middle, which has 0 spaces


ALGORITHM:
- Determine the number of spaces between each star for the top/bottom row
- Set a space counter to that number
- Set an indentation counter  to 0
- Until the space counter is 0:
  - Print stars separated by current number of spaces
  - Reduce the space counter by 1
  - Increase indentation by 1
- Once three stars without spaces have been printed, print middle row of n stars
- Reverse the procedure: until the space counter is back up to the number of spaces in between each star at bottom
  - Print stars separated by current number of spaces, starting at 0 spaces
  - Increase space counter by 1
  - Reduce indentation by 1

=end

def star_row(spaces, indent)
  ' ' * indent + ('*' + ' ' * spaces) * 2 + '*'
end

def star(n)
  max_spaces = (n - 3) / 2
  spaces = max_spaces
  indent = 0

  # Top half
  loop do
    puts star_row(spaces, indent)
    break if spaces == 0
    spaces -= 1
    indent += 1
  end

  # Middle row
  puts '*' * n

  # Bottom half
  loop do 
    puts star_row(spaces, indent)
    break if spaces == max_spaces
    spaces += 1
    indent -= 1
  end
end

# Examples:
star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

puts 
star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *