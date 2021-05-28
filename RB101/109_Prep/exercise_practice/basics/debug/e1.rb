# e1
# def find_first_nonzero_among(numbers)
#   numbers.each do |n|
#     return n if n.nonzero?
#   end
# end

# # Examples

# find_first_nonzero_among([0, 0, 1, 0, 2, 0])
# # receivinig a wrong number of arguments error. this method call has six arguments but the
# # method is only expecting one. to fix, need to have one argument that is an array
# find_first_nonzero_among([1])

# e2

# def predict_weather
#   sunshine = ['true', 'false'].sample

#   if sunshine == "true" # need to put a == otherwise it is always truthy
#     puts "Today's weather will be sunny!"
#   else
#     puts "Today's weather will be cloudy!"
#   end

#   p sunshine
# end

# predict_weather


# e3
# def multiply_by_five(n)
#   n * 5
# end

# puts "Hello! Which number would you like to multiply by 5?"
# number = gets.chomp.to_i #need to add a to_i method call

# puts "The result is #{multiply_by_five(number)}!"

# # e4
# pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

# pets[:dog].push("bowser")

# p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

# # e5
# numbers = [5, 2, 9, 6, 3, 1, 8]

# even_numbers = numbers.select do |n|
#   n if n.even?
# end

# p even_numbers # expected output: [2, 6, 8]
# # need to use the select method to select specific array elements.
# # map iterates over each element and returns nil if the condition is not met

# # e6
# def get_quote(person)
#   if person == 'Yoda'
#     'Do. Or do not. There is no try.'
#     elsif person == 'Confucius'
#     'I hear and I forget. I see and I remember. I do and I understand.'
#     elsif person == 'Einstein'
#     'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
#   end
# end

# puts 'Confucius says:'
# puts '"' + get_quote('Confucius') + '"'

# e7
# Financially, you started the year with a clean slate.

# balance = 0

# # Here's what you earned and spent during the first three months.

# january = {
#   income: [ 1200, 75 ],
#   expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
# }

# february = {
#   income: [ 1200 ],
#   expenses: [ 650, 140, 320, 46.7, 122.5 ]
# }

# march = {
#   income: [ 1200, 10, 75 ],
#   expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
# }

# # Let's see how much you've got now...

# def calculate_balance(month)
#   plus  = month[:income].sum
#   minus = month[:expenses].sum

#   plus - minus
# end

# [january, february, march].each do |month|
#   balance += calculate_balance(month) #this was being reasssigned on each iteration
#   # += reassigns but cumulatively
# end

# puts balance


# # e8
# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook', "chair"]

# colors.shuffle!
# things.shuffle!

# shorter_arr = []

# def shorter(arr1, arr2)
#  if arr1.length <= arr2.length
#   return arr1
#  else
#   return arr2
#  end
# end

# shorter_arr = shorter(colors, things)
# # p shorter_arr

# i = 0
# loop do
#   break if i > shorter_arr.length-1

#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#     # puts "And a #{colors[i]} #{things[i]}"
#   end

#   i += 1

# end

# # e9

# def digit_product(str_num)
#   digits = str_num.chars.map { |n| n.to_i }
#   product = 1

#   digits.each do |digit|
#     product *= digit
#   end

#   product
# end


# p digit_product('12345')
# # expected return value: 120
# # actual return value: 0

# e10
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

# p input

# strength = character_classes[:input]

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player