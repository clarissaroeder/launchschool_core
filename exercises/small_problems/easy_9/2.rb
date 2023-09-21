=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

ALGORITHM:
- Turn number into a string and count digits
- If digits are odd, return number * 2
- If digits are even, split the string representation in half:
  - If the first half is identical to the second, return number
  - If not, return number * 2

=end


def twice(num)
  num_string = num.to_s
  center = num_string.size / 2

  if num_string.size.even?
    if num_string[0, center] == num_string[center..-1]
      num
    else
      num * 2
    end
  else
    num * 2
  end
end

# Examples:
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
