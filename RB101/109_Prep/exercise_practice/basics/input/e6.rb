PASS = "password"

loop do
  puts "please enter your password"
  answer = gets.chomp

  if answer != PASS
    puts "invalid, try again"
  else
    puts "Welcome!"
    break
  end

end