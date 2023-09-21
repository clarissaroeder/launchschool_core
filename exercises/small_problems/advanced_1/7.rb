=begin
---------------
PROBLEM
---------------
Merge two sorted arrays.

Input: Two arrays
Output: One array, sorted
Rules: Don't sort the merged array, but build result array element by element. Don't mutate input arrays.

EXAMPLE
---------------
[1, 1, 3]  [2, 2]

1 <=> 2 -> 1, array 1 move up one index, array 2 stays the same
1 <=> 2 -> 1, array 1 move up one index, array 2 stays the same
3 <=> 2 -> 2, array 1 stays, array 2 moves 
3 <=> 2 -> array 1 stays, array 2 moves
3 -> no items left to compare to ? -> move array 1

ALGORITHM
---------------
- Define a result array
- Compare the elements individually:
  - Set index variables for both arrays to 0
  - Compare elements of the arrays at current indicies
  - Add the smaller one to the result array
  - Move the index of the array from which the element was added up one
  - Leave the index of the other array as is
  - Repeat until both indices are at the end of the array, i.e., no elements are left
  - If one index reaches the end before the other, just add the remaining elements in order to the result

---------------
NOTES:
- Since the arrays are already sorted, only the first elements need to be compared

=end

# def merge(arr1, arr2)
#   result = []
#   i = 0
#   j = 0
  
#   loop do 
#     case arr1[i] <=> arr2[j]
#     when -1
#       result << arr1[i]
#       i += 1
#     when 0
#       result << arr1[i]
#       result << arr2[j]
#       i += 1
#       j += 1
#     when 1
#       result << arr2[j]
#       j += 1
#     end

#     if i == arr1.size
#       loop do
#         result << arr2[j]
#         j += 1
#         break if j == arr2.size
#       end
#     elsif j == arr2.size
#       loop do 
#         result << arr1[i]
#         i += 1
#         break if i == arr1.size
#       end
#     end

#     break if i == arr1.size && j == arr2.size
#   end

#   result
# end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

# Examples:
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]