# Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

puts "What is your name?"
name = gets.chomp

if name.include?("!")
  name = name.chop
  puts "hello #{name}. Why are we screaming?".upcase
else
  puts "Hello #{name}"
end
