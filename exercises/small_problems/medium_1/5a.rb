=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied 
as an argument to the method. You may assume that the argument will always be an odd integer.

NOTES:
Breiteste linie: 1 space and n stars
  -> Einen space in jeder reihe als default
Mitte ist der n/2.ceil ste platz
Erste reihe spaces ist daher mitte - 1 

 Reihe 1:
  - Print mitte - 1 number of spaces
  - Print 1 star

  Reihe 2:
  - Print mitte - 2 numer of spaces
  - Print 3 stars

ALGORITHM:
- Determine middle position: n/2 + 1
- Define filler space number to 1
- Upper half: from 1 up to n:
  - Skip if i is even
  - Reduce middle by 1
  - If i == 1
    - Print middle * spaces
    - Print i * star
  - Else
    - Print middle * spaces
    - Print a star, filler, star
    - filler + 2

- Lower half: from n-1 down to 1:
  - Skip if i is even
  - Increase middle by 1
  - If i == 1
    - Print middle * spaces and i * stars
  - Else
    - Print middle * spaces
    - Print a star, filler, star
    - filler - 2
=end

SPACE = " "
STAR = "*"

def diamond(n)
  middle = n / 2 + 1
  filler = -1

  1.upto(n) do |i|
    next if i.even?
    middle -= 1
    if i == 1
      puts SPACE * middle + STAR * i 
    else
      filler += 2
      puts SPACE * middle + STAR + SPACE * filler + STAR
    end
  end

  (n - 1).downto(1) do |i|
    next if i.even?
    middle += 1
    if i == 1
      puts SPACE * middle + STAR * i
    else
      filler -= 2
      puts SPACE * middle + STAR + SPACE * filler + STAR
    end
  end
end

# Examples:

diamond(5)

#   *
#  * *
# *   *
#  * *
#   *
puts 

diamond(3)
#  *
# ***
#  *
puts

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *