=begin
---------------
PROBLEM
---------------
Sort an array of passed in values using merge sort.
Input: Array
Output: Sorted array -> same array object?
Rules:
- Arrays will contain only one type of data (numbers or strings)
- Merge sort should be implemented recursively

ALGORITHM
---------------
- Check the size of the array
- If there is more than one element in the array:
  - Split the array in half (or closest thereto)
    - Check the size of the left half
    - If there is more than one element, split that in half and repeat
- If there is one element in the array:
  - Return that array
  - Merge the two halves by comparing each element individually (merge sorted lists from previous exercise)

- Repeat process for the right half

Lower level:
- If array only has one number
  - Quit
- Else
  - Sort left half (recursive call)
  - Sort right half (recursive call)
  - Merge halfes
---------------
=end

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

def merge_sort(array)
  return array if array.size == 1 

  halves = [merge_sort(array[0, (array.size / 2)]), merge_sort(array[(array.size / 2)..-1])] 
  merge(halves[0], halves[1])
end

# Examples:
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
