PASS = "password"
USER = "admin"

loop do
  puts "please enter your username"
  username = gets.chomp

  puts "please enter your password"
  password = gets.chomp

  if password != PASS && username != USER
    puts "invalid, try again"
  else
    puts "Welcome!"
    break
  end

end