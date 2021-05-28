
number_of_lines = nil

# loop do
#   loop do
#     puts '>> How many output lines do you want? Enter a number >= 3: Q to quit'
#     number_of_lines = gets.chomp
#     break if number_of_lines.to_i >= 3
#     puts ">> That's not enough lines."
#   end

#   while number_of_lines.to_i > 0
#     puts 'Launch School is the best!'
#     number_of_lines -= 1
#   end
#   break if number_of_lines == "q" || number_of_lines == "Q"
# end


loop do
  puts "How many output lines do you want? Enter a number >= 3: Q to quit"
    num = gets.chomp
  if num.to_i >= 3
    num.to_i.times {puts "LS is the best!"}
  elsif num.to_i < 3 && num.downcase != "q" && num.downcase != "Q"
    puts "that's not enough lines"
  else
    puts "bye bye!"
    break if num == "Q" || num == "q"
  end


end