=begin

ALGORITHM:
- Iterate over column index: 0 - 1 - 2
  - Iterate over row index: 0 - 1 - 2 
    - Element at array[row][column] should become array[column][row]

    - From column 0 to 1:
      - For column 0: rows 0 - 2
      - For column 1: row 1 -2 

    - Start at column 0 and row 0 - 2
      - [0][0] -> [0][0] (vice versa)               1 4 3
      - [1][0] -> [0][1] (vice versa)               5 7 9
      - [2][0] -> [0][2] (vice versa)               8 2 6
    - Column 1 and row 1 - 2
      - [1][1] -> [1][1]
      - [2][1] -> [1][2]
    - Colum 2 and row 2 
      - [2][2] -> [2][2]

=end

def transpose!(array)
  0.upto(1) do |column|
    case column
    when 0
      0.upto(2) { |row| array[row][column], array[column][row] = array[column][row], array[row][column] }
    when 1
      1.upto(2) { |row| array[row][column], array[column][row] = array[column][row], array[row][column] }
    end
  end

  array
end

# Examples:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]