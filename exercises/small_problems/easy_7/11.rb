=begin
Write a method that counts the number of occurrences of each element in a given array.
The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

ALGORITHM
- define an empty hash
- iterate over array
  - if current element included in the keys? increment value by 1
  - if not, add new key-value pair
- iterate over hash
  - print each key value pair

=end

def count_occurrences(arr)
  counts = {}
  arr.each do |vehicle|
    if counts.key? vehicle
      counts[vehicle] += 1
    else
      counts[vehicle] = 1
    end
  end

  counts.each do |vehicle, count|
    puts "#{vehicle} => #{count}"
  end
end


# Examples:
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2