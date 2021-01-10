# Build a program that randomly generates and prints Teddy's age. To get the age,
# you should generate a random number between 20 and 200.

# Teddy is 69 years old!

# age = rand(20..200)

# puts "Tedd is #{age} years old!"

# further exploration

puts "What is your name?"

name = gets.chomp

age = rand(20..200)

if name.empty?
  puts "Teddy is #{age} years old!"
else
  puts "#{name} is #{age} years old!"
end


