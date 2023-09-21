def select_fruit(hash)
  keys = hash.keys
  selected_fruits = {}
  counter = 0

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end
  selected_fruits
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}