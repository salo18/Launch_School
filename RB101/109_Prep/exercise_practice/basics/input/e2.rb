# Write a program that asks the user for their age in years, and then converts that age to months.

loop do
  puts "how old are you? in years"

  years = gets.chomp.to_i
  
  if years > 0
    puts "you are #{years*12} months old"
    break
  else
    puts "make sure to enter a number!"
  end
end



