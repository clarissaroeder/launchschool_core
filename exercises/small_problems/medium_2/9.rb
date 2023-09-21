=begin
---------------
PROBLEM
---------------
Write a method that destructively bubble sorts a given array.

Input: Array
Output: Same array
Rules: Must use bubble sort. May assume any array has at least two elements.

EXAMPLE
---------------
[6, 2, 7, 1, 4] -> 6 > 2?
[2, 6, 7, 1, 4] -> 6 > 7?
[2, 6, 7, 1, 4] -> 7 > 1?
[2, 6, 1, 7, 4] -> 7 > 4?
[2, 6, 1, 4, 7] -> first iteration finished

ALGORITHM
---------------
- Iterate over the array until no more swaps are being made:
  - Set a swap counter variable to 0

  - Sort the elements:
    - Iterate over the array until second to last element
    - Set a counter variable: while counter is smaller than array size:
      - Compare current element with next element
      - Is the current element larger than the next?
        - If yes, swap their places and add one to the swap counter
        - If no, continue to next element
    - If after the iteration the swap counter is 0, no swaps have been made in that iteration
      - If zero: break out of the loop
      - If non-zero: reset and repeat

---------------
NOTES:
- With each with index: will compare last element with out of bounds index on last iteration

=end

def bubble_sort!(array)
  loop do
    swaps = false
    0.upto(array.size - 2) do |i|
      next if array[i] <= array[i + 1]
      array[i], array[i + 1] = array[i + 1], array[i]
      swaps = true
    end

    break unless swaps
  end

  array
end

# Examples:
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)