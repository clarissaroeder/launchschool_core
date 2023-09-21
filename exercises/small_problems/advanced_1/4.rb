=begin

EXAMPLE
---------------

[[1, 2, 3, 4, 5], => [[1, 4, 3], 
 [4, 3, 2, 1, 0],     [2, 3, 7],
 [3, 7, 8, 6, 2]]     [3, 2, 8],
                      [4, 1, 6], 
                      [5, 0, 2]]

  

array.size == number of rows
inner_array.size == number of columns

ALGORITHM
---------------
- Define a new array
- Identify number of colums and rows and save in separate variables


---------------
NOTES:
- 

=end

def transpose(array)
  trans_array = []
  row_number = array.size - 1
  column_number = array[0].size - 1

  (0..column_number).each do |column_idx|
    trans_array << (0..row_number).map { |row_idx| array[row_idx][column_idx] }
  end

  trans_array
end

# Examples:
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]