# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

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

integer = 0

puts "Please enter an integer greater than 0:"
loop do
integer = gets.chomp.to_i
  if integer > 0
    break
  else
    puts "Try again. Please enter a valid integer greater than 0:"
  end
end

puts "Enter 's' to compute the sum, 'p' to compute the product."

sum_or_product = ""
loop do
  sum_or_product = gets.chomp.downcase
  if sum_or_product == "s" || sum_or_product == "p"
    break
  else
    puts "Make sure to enter 's' or 'p'"
  end
end

if sum_or_product == "s"
  result = (1..integer).to_a.sum
  puts "The sum of the integers between 1 and #{integer} is #{result}"
elsif sum_or_product == "p"
  result = (1..integer).to_a.inject(:*)
  puts "The product of the integers between 1 and #{integer} is #{result}"
end
