
num = nil

loop do
  puts "How many output lines do you want? Enter a number >= 3:"
    num = gets.chomp.to_i

  if num >= 3
   num.times {puts "LS is the best!"}
   break
  else
    puts "that's not enough lines"
  end

end