fruits = ['apple', 'banana', 'pear']
transformed_elements = []
counter = 0
# add an "s" to each element

loop do
  current_fruit = fruits[counter]

  transformed_elements << current_fruit + "s"

  counter += 1

  break if counter == fruits.size
end

p transformed_elements