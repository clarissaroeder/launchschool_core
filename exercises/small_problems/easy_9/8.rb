=begin
Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.


- Define result array
- Iterate over input array to transform:
  - Quantity number of times add the fruit to a new array and return that array
- Flatten and return
=end

def buy_fruit(arr)
  arr.map do |sub|
    fruit = []
    sub[1].times { |_| fruit << sub[0] }
    fruit
  end.flatten
end

# Examples:
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]