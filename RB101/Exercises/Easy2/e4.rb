# Build a program that displays when the user will retire and how many years she has
# to work till retirement.

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

# puts "What is your age?"
# age = gets.chomp.to_i

age = 0

loop do
puts "What is your age?"
age = gets.chomp.to_i
  if age > 0
    break
  else
    puts "That's not a real age. Try again."
  end
end


retirement_age = 0

loop do
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i
  if retirement_age > 0
    break
  else
    puts "That's not a real age. Try again."
  end
end

year = Time.now.year
years_to_retirement = retirement_age - age
retirement_year = year + years_to_retirement

puts "It's #{year}. You will retire in #{retirement_year}"

puts "You only have #{years_to_retirement} years of work to go!"