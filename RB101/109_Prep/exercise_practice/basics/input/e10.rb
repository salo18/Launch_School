def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

# def negative(number)
#   number.start_with?("-")
# end

# def positive(number)
#   false if number.start_with?("-")
# end

def add(num1, num2)
  result = num1 + num2
  puts "#{num1} + #{num2} = #{result}"
end

loop do
  puts "Please enter a positive or negative integer:"
  num1 = gets.chomp.to_i

  puts "Please enter a positive or negative integer:"
  num2 = gets.chomp.to_i

  if (num1.to_i > 0 && num2.to_i < 0) || (num1.to_i < 0 && num2.to_i > 0)
    add(num1, num2)
    break if valid_number?(num1) && valid_number?(num2)
  elsif num1.to_i == 0 || num2.to_i == 0
    puts "Invalid input. Only non-zero integers are allowed."
  else
    puts "Sorry. One integer must be positive, one must be negative."
  end

end