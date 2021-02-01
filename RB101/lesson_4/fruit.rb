# select the key-value pairs where the value is 'Fruit'.

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  hash_keys = hash.keys
  counter = 0
  new_hash = {}

  loop do
    break if counter == hash.size

    current_key = hash_keys[counter]
    current_value = hash[current_key]

    if current_value == "Fruit"
      new_hash[current_key] = current_value
    end

    counter += 1
  end

  p new_hash
end


select_fruit(produce)













# def select_fruit(produce_list)
#   produce_keys = produce_list.keys
#   counter = 0
#   selected_fruits = {}

#   loop do
#     break if counter == produce_keys.size

#     current_key = produce_keys[counter]
#     current_value = produce_list[current_key]

#     if current_value == "Fruit"
#       selected_fruits[current_key] = current_value
#     end
#     counter += 1
#   end

#   p selected_fruits
# end

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}