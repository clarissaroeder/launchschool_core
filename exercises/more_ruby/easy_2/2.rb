=begin
Write your own version of zip that does the same type of operation. 
It should take two Arrays as arguments, and return a new Array (the original Arrays should not be changed). 
Do not use the built-in Array#zip method. You may assume that both input arrays have the same number of elements.

=end

# def zip(array1, array2)
#   result = []
#   array1.each_with_index do |value, idx|
#     result << [value, array2[idx]]
#   end

#   result
# end

def zip(array1, array2)
  array1.each_with_index.with_object([]) do |(value, idx), result|
    result << [value, array2[idx]]
  end
end

# Example
p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]