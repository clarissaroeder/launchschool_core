=begin
Write a method that can rotate the last n digits of a number. 
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

ALGORITHM:
- turn number into an array of digits
- split off digits to rotate: from -n to -1  
- pass into rotate_array method
- replace unrotated digits
- join to a string and turn into integer
- return

=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_array = num.to_s.chars
  num_array[-n..-1] = rotate_array(num_array[-n..-1])
  num_array.join.to_i
end


# Examples:
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917