# e1
# pets = ['cat', 'dog', 'fish', 'lizard']

# my_pet = pets[2]

# p "i have a #{my_pet}"

# e2
# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2,3]
# puts "I have a #{my_pets[0]} and a #{my_pets[1]}"

#e3
# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2, 3]
# my_pets.pop
# puts "I have a #{my_pets[0]}"

# e4
# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2..3]
# my_pets.pop
# p my_pets

# my_pets << pets[1]
# p my_pets
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"

# e5
# colors = ['red', 'yellow', 'purple', 'green']

# colors.each do |color|
#   puts "I'm the color #{color}"
# end

# e6
# numbers = [1, 2, 3, 4, 5]

# doubled_numbers = numbers.map do |num|
#   num * 2
# end

# p doubled_numbers

# e7
# numbers = [5, 9, 21, 26, 39]

# divisible_by_three = numbers.select { |num| num %3 == 0}
# p divisible_by_three

# e8
# [['Dave', 7], ['Miranda', 3], ['Jason', 11]]

# e9
# favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
# p favorites.flatten

# e10
array1 = [1, 5, 9]
array2 = [1, 9, 5]

p array1 == array2

