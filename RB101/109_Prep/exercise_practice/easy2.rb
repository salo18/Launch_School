# 1
# def teddy_age()
#   puts "What is your name"
#   name = gets.chomp
#   name = "Teddy" if name.empty?
#   puts "#{name} is #{rand(20..200)} years old!"
# end

# teddy_age

# 2
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).

# def length_width()
#   puts "Enter the length of the room"
#   length = gets.chomp.to_i
#   puts "Enter the width of the room"
#   width = gets.chomp.to_i
#   area = length*width
#   sqft = area * 10.7639
#   puts "The area of the room is #{area} square meters (#{sqft} square feet)."
# end

# length_width

# 3

# def tip
#   puts "What is the bill?"
#   bill = gets.chomp.to_f
#   puts "What is the tip percentage?"
#   percentage = gets.chomp.to_f


#   tip = (bill * percentage) / 100

#   puts "The tip is #{tip.round(3)}"
#   puts "The total is #{(bill + tip).round(3)}"
# end

# tip

# 4
# def retire
#   puts "What is your age?"
#   age = gets.chomp.to_i

#   puts "At what age would you like to retire?"
#   retire_age = gets.chomp.to_i

#   year = Time.now.year
#   years_of_work_left = retire_age - age
#   puts "It's #{year}. You will retire in #{years_of_work_left + year}"
#   puts "You only have #{years_of_work_left} years of work to go!"
# end

# retire

# 5
# def greeting
#   puts "what is your name?"
#   name = gets.chomp
#   if name.include?("!")
#     puts "HELLO #{name.upcase} WHY ARE WE SCREAMING?"
#   else
#     puts "Hello #{name}"
#   end
# end

# greeting

# 6 / 7
# (1...100).each do |num|
#   puts num if num.even?
# end

# 8
# def sum_product
#   puts "Please enter an integer greater than 0:"
#   integer = 0
#   loop do
#     integer = gets.chomp.to_i
#     if integer < 1
#       puts "Integer must be greater than 0"
#     end
#     break if integer >= 1
#   end

#   puts "Enter 's' to compute the sum, 'p' to compute the product."
#   sum_or_product = ""

#   loop do
#     sum_or_product = gets.chomp.downcase
#     if sum_or_product != "s" || sum_or_product != "p"
#       puts "please enter 's' or 'p'"
#     end
#     break if sum_or_product == "s" || sum_or_product == "p"
#   end

#   sum = 0
#   # (1..integer).each do |num|
#   #   sum += num
#   # end
#   sum = (1..integer).inject(:+)

#   product = 1
#   # (1..integer).each do |num|
#   #   product *= num
#   # end
#   product = (1..integer).inject(:*)

#   if sum_or_product == "s"
#     puts "The sum of the integers between 1 and #{integer} is #{sum}."
#   elsif sum_or_product == "p"
#     puts "The product of the integers between 1 and #{integer} is #{product}."
#   end
# end
# sum_product


# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

# 9
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name
# => BOB, BOB
# upcase is a destructive method call that mutates the caller
# since name and save_name point to the same object, both are mutated

# 10
# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2
# array2 should contain the original array that was put into it with the first each call
# copies were put into the array so they are not affected by the destructive method call
# wrong... << passes in a reference, not a copy
