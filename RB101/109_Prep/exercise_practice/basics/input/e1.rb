# $ ruby repeater.rb
# >> Type anything you want:
# This is what I typed.
# This is what I typed.


# Write a program that asks the user to type something in, after which your program should simply display what was entered.


puts "type something"
answer = gets.chomp

puts "you said #{answer}"