# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

# pseudocode
# ask user for six numbers
# turn those numbers into an array
# ask the array if the number is included
# puts the number and array

puts "Enter the 1st number"
num1 = gets.chomp.to_i

puts "Enter the 2nd number"
num2 = gets.chomp.to_i

puts "Enter the 3rd number"
num3 = gets.chomp.to_i

puts "Enter the 4th number"
num4 = gets.chomp.to_i

puts "Enter the 5th number"
num5 = gets.chomp.to_i

puts "Enter the 6th number"
num6 = gets.chomp.to_i

array = [num1, num2, num3, num4, num5]

if array.include?(num6)
  puts "The number #{num6} appears in #{array}"
else
  puts "The nnumber #{num6} does not appear in #{array}"
end

