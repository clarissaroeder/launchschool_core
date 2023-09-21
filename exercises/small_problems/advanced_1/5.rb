=begin
---------------
PROBLEM
---------------
Rotate the matrix by 90 degrees!

ALGORITHM
---------------
- Define an empty result matrix
- Identify number of rows and columns
-> The rows of the result matrix should be the reversed columns of the input <-

- Iterate over the columns:
  - Iterate over the rows
  - Select elements at the current column of each row 
  - Save those elements as a new row
  - Reverse the row
  - Add row to result array

---------------
NOTES:
- To rotate a matrix, take each column, make it a row and reverse the order

=end

def rotate90(array)
  result = []
  row_number = array.size
  column_number = array.first.size

  (0...column_number).each do |column_idx|
    new_row = (0...row_number).map { |row_idx| array[row_idx][column_idx] }
    result << new_row.reverse
  end

  result
end

# Examples:
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2