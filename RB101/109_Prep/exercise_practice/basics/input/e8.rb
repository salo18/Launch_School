def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num1 = nil
num2 = nil

loop do
  puts "please enter the numerator"
  num1 = gets.chomp
  if valid_number?(num1)
    break
  else
    puts "that's not a valid number"
  end
end

loop do
  puts "please enter the denomenator"
  num2 = gets.chomp
  if valid_number?(num2) && num2 != "0"
    break
  else
    puts "that's not a valid number"
  end
end

division = num1.to_i / num2.to_i

puts "#{num1} / #{num2} is #{division}"