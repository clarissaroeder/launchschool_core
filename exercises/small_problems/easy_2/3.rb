# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

def tip_calculator(bill_amount, tip_in_percent)
  tip = bill_amount * (tip_in_percent / 100)
  total = bill_amount + tip

  puts "The tip is §#{format("%.2f", tip)}"
  puts "The total is $#{format("%.2f", total)}"
end

print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
percent = gets.to_f

tip_calculator(bill, percent)