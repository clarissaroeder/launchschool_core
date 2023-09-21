def sum_row(row_num)
  rows = []
  start_int = 2
  (1..row_num).each do |current_row|
    rows << create_row(start_int, current_row)
    start_int = rows.last.last + 2
  end
  rows.last.sum # TODO: return sum of last row
end

def create_row(start_int, row_length)
  row = []
  current_int = start_int
  loop do 
    row << current_int
    current_int +=2
    break if row.length == row_length
  end
  row
end

# Test cases
p sum_row(1) #== 2   #true
p sum_row(2) #== 10  
p sum_row(4) #== 68  

# p create_row(2, 1) #== [2]         
# p create_row(4, 2) #== [4, 6]      
# p create_row(8, 3) #== [8, 10, 12] 
