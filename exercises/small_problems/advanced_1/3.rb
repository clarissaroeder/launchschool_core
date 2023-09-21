=begin
---------------
PROBLEM
---------------
Input: Nested array (3x3 matrix)
Output: Nested array (3x3 matrix)
Rules:
- Rows and columns should be switched: row 1 becomes column 1 etc.
- No use of Matrix class or #transpose method
- Original matrix should not be modified (no indexed reassignment)

EXAMPLE
---------------
   1 2 3
1  1 5 8
2  4 7 2
3  3 9 6

   1 2 3
1  1 4 3
2  5 7 9
3  8 2 6

DATA STRUCTURES
---------------
- Buffer array, or array copy ?

ALGORITHM
---------------
- Create a new array by re-arranging the input array elements 
                                                                                        [1, 5, 8] idx 0         [1, 4, 3] all elements are idx 0 in their respective array
  - Each element of the new array should be a row (array) -> [] = array.map_with_index { |input_row, i| this block should return an array}
    - The row should be the column of the input array:
      - Loop over the input array and select all elements of the same index as the current index

- Loop over the array columns:
  - Loop over the input array rows: 
    - Place element of current column of each row into a single row in new array
- Return transposed matrix
---------------
NOTES:
- 
=end

def transpose(array)
  trans_array = []
  array.each_with_index do |row, idx|
    trans_array << array.map { |r| r[idx]}
  end
  trans_array
end

# Examples:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]