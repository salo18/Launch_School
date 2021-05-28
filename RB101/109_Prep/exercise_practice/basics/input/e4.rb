
loop do
  puts "Do you want me to print something? (y/n)"
  answer = gets.chomp.upcase!

  if answer == "Y"
    puts "something"
    break
  elsif answer == "N"
    break
  else
    puts "Try again... use a Y or N"
  end
end
